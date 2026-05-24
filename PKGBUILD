# Maintainer: Selene Bray-Hernandez <selebray1998@gmail.com>

# pkgbase must match the AUR repository name
pkgbase=gimp-openvino
pkgname=gimp-openvino
pkgver=3.2.1.0  # auto-set by pkgver()
pkgrel=11
pkgdesc="Intel OpenVINO AI Plugins for GIMP"
arch=('x86_64')
url="https://github.com/intel/openvino-ai-plugins-gimp"
license=('Apache-2.0' 'MIT')
# Note: This package only installs the GIMP OpenVINO plugins. GPU acceleration depends on the
# OpenVINO runtime (openvino package) and the system's hardware drivers (e.g., intel-compute-runtime for Intel GPUs,
# NVIDIA CUDA drivers for NVIDIA GPUs, ROCm stack for AMD GPUs). Ensure that the openvino package
# is installed with the desired backend support and that the corresponding drivers are present.
depends=(
  'gimp'
  'python'
  'openvino-models'
  'python-numpy'
  'python-requests'
  'python-opencv'
  'python-transformers'
  'python-diffusers'
  'python-psutil'
  'python-sentencepiece'
  'python-pydantic'
  'python-timm'
)
optdepends=(
  'intel-compute-runtime: Intel GPU acceleration for OpenVINO'
  'intel-npu-driver: NPU acceleration support'
  'openvino-intel-gpu-plugin: Intel GPU plugin for OpenVINO'
  # For NVIDIA GPU acceleration: Install NVIDIA CUDA drivers
  #   and ensure the openvino package has CUDA support
  # For AMD GPU acceleration: Install AMD ROCm drivers
  #   and ensure the openvino package has ROCm support
)
makedepends=('git' 'python-pip')
source=("$pkgname::git+https://github.com/intel/openvino-ai-plugins-gimp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(git describe --tags --long 2>/dev/null || echo '0.0.0-0-g0000000')"
  ver="${ver%-g*}"
  echo "${ver//-/.}"
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  :
}

package() {
  cd "$srcdir/$pkgname"

  local pyver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  local site_packages="$pkgdir/usr/lib/python$pyver/site-packages"
  local models_dir="$pkgdir/usr/share/$pkgname"

   # Install pip-only deps not available in Arch repos or AUR
   PIP_REQUIRE_VIRTUALENV=0 python -m pip install \
     gdown peft openvino controlnet-aux openvino-genai tomesd \
     --root="$pkgdir" --prefix=/usr --no-deps --prefer-binary --ignore-installed --root-user-action=ignore 2>/dev/null || true

   # Install the main package (deps handled by system packages)
   PIP_REQUIRE_VIRTUALENV=0 python -m pip install . \
     --root="$pkgdir" --prefix=/usr --no-deps --prefer-binary --ignore-installed --root-user-action=ignore

  # Set up config and install bundled weights
  GIMP_OPENVINO_MODELS_PATH="$models_dir" \
    python -c "
import sys, json
sys.path.insert(0, '$site_packages')
from gimpopenvino import install_utils
install_utils.complete_install(repo_weights_dir='$srcdir/$pkgname/weights')
# Fix weight_path to runtime path instead of build path
config_file = '$site_packages/gimpopenvino/plugins/openvino_utils/tools/gimp_openvino_config.json'
with open(config_file) as f:
    cfg = json.load(f)
old = '$pkgdir'
if cfg['weight_path'].startswith(old):
    cfg['weight_path'] = cfg['weight_path'].replace(old, '', 1)
with open(config_file, 'w') as f:
    json.dump(cfg, f, indent=4)
"

  # Make models directory writable so plugins can write cache images at runtime
  chmod -R g+w "$models_dir"

  # Copy plugin files to GIMP plugin directory
  local plugindir="$pkgdir/usr/lib/gimp/3.0/plug-ins"
  mkdir -p "$plugindir"

  for d in openvino_utils semseg_ov stable_diffusion_ov superresolution_ov fastsd_ov; do
    mkdir -p "$plugindir/$d"
    local plugin_src="$site_packages/gimpopenvino/plugins/$d"
    if [[ -d "$plugin_src" ]]; then
      cp -r "$plugin_src"/* "$plugindir/$d/"
    fi
  done

  # Wrapper script for launching GIMP with OpenVINO support
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/openvino-ai-gimp" <<'EOF'
#!/bin/bash
export GI_TYPELIB_PATH=/usr/lib/x86_64-linux-gnu/girepository-1.0:/usr/local/lib/x86_64-linux-gnu/girepository-1.0
export LD_LIBRARY_PATH=/usr/local/lib/x86_64-linux-gnu
exec gimp-3 "$@"
EOF
  chmod +x "$pkgdir/usr/bin/openvino-ai-gimp"

  # License
  if [[ -f "LICENSE" ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [[ -f "LICENSE.md" ]]; then
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Documentation
  if [[ -d "Docs" ]]; then
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cp -r Docs/* "$pkgdir/usr/share/doc/$pkgname/"
  fi
}
