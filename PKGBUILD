# Maintainer: Selene Bray-Hernandez <selebray1998@gmail.com>

# pkgbase must match the AUR repository name
pkgbase=gimp-openvino
pkgname=gimp-openvino
pkgver=3.2.1.0  # auto-set by pkgver()
pkgrel=1
pkgdesc="Intel OpenVINO AI Plugins for GIMP"
arch=('x86_64')
url="https://github.com/intel/openvino-ai-plugins-gimp"
license=('Apache-2.0' 'MIT')
depends=(
  'gimp'
  'python'
  'openvino-models'
  'python-openvino'
  'python-numpy'
  'python-scipy'
  'python-requests'
  'python-opencv'
  'python-scikit-image'
  'python-transformers'
  'python-diffusers'
  'python-psutil'
  'python-matplotlib'
  'python-sentencepiece'
  'python-pydantic'
  'python-optimum'
  'python-peft'
  'python-timm'
  'python-hf-xet'
)
optdepends=(
  'intel-compute-runtime: Intel GPU acceleration for OpenVINO'
  'intel-npu-driver: NPU acceleration support'
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
    gdown controlnet-aux openvino-genai optimum-intel tomesd \
    --root="$pkgdir" --prefix=/usr --no-deps 2>/dev/null || true

  # Install the main package (deps handled by system packages)
  PIP_REQUIRE_VIRTUALENV=0 python -m pip install . \
    --root="$pkgdir" --prefix=/usr --no-deps

  # Set up config and install bundled weights
  GIMP_OPENVINO_MODELS_PATH="$models_dir" \
    python -c "
import sys
sys.path.insert(0, '$site_packages')
from gimpopenvino import install_utils
install_utils.complete_install(repo_weights_dir='$srcdir/$pkgname/weights')
"

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
