# Maintainer: James Brink <brink.james@gmail.com>
# Maintainer: Jeffrey Dilley <jeff.dilley@gmail.com>

pkgname=mold-ai-desktop
_binname=mold-desktop
pkgver=0.34.0
pkgrel=1
pkgdesc="Mold desktop app — local AI image and video generation with a gallery, model manager and job queue (built from source, CUDA)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')

# The engine runs in-process on the local GPU, so the CUDA runtime is a real
# dependency, exactly as for `mold-ai`.
depends=(
  'cuda'
  'cudnn'
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'hicolor-icon-theme'
  'gcc-libs'
  'glibc'
)

optdepends=(
  'nvidia-utils: NVIDIA GPU driver (required for any local GPU generation)'
  'ffmpeg: video upscaling and mp4 mux fallback'
  'gst-plugins-good: in-app video playback'
  'gst-plugins-bad: in-app video playback'
  'gst-libav: H.264 in-app video playback'
)

# Same toolchain as `mold-ai` (see its PKGBUILD for why each is needed).
# No tauri-cli: build() compiles the crate with plain cargo and the
# `tauri/custom-protocol` feature that `tauri build` would otherwise add.
makedepends=(
  'rust>=1.93'
  'cargo'
  'cuda'
  'cudnn'
  'clang'
  'lld'
  'nasm'
  'bun'
  'protobuf'
  'pkgconf'
)

# Installs /usr/bin/mold-desktop only, so it coexists with the `mold-ai*`
# CLI packages and with extra/mold (the rui314 linker).
provides=("${pkgname}=${pkgver}")
conflicts=('mold-ai-desktop-bin')

# The desktop crate's release profile already sets `lto = "thin"`; makepkg's outer
# `-flto` flags conflict with that and slow the build for no gain.
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1aa8eb536efa428f09e883eb68901bd57e04fd59c515b372ffc229a0d0af732')

_manifest=desktop/src-tauri/Cargo.toml

prepare() {
  cd "mold-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  # The desktop crate is its own cargo root with its own lockfile.
  cargo fetch --locked --manifest-path "${_manifest}"
  # Installs the Bun workspace (prepare may use the network; build() runs
  # offline) and builds the web SPA mold-server's build.rs embeds.
  ./scripts/ensure-web-dist.sh
}

build() {
  cd "mold-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  # Default to Ada Lovelace (sm_89, RTX 40-series). Other users override with
  # 86 for RTX 3090/A40 or 120 for RTX 50-series.
  export CUDA_COMPUTE_CAP="${CUDA_COMPUTE_CAP:-89}"
  # B200/B300 is server-only, as in flake.nix (no mold-desktop-sm100): the
  # desktop app reaches one remotely. Install mold-ai there instead.
  if [[ "${CUDA_COMPUTE_CAP}" == "100" ]]; then
    echo "error: CUDA_COMPUTE_CAP=100 (B200/B300) is server-only; use mold-ai on that host" >&2
    return 1
  fi
  export PATH="/opt/cuda/bin:${PATH}"
  export LIBRARY_PATH="/opt/cuda/lib64/stubs${LIBRARY_PATH:+:${LIBRARY_PATH}}"

  # Tauri embeds desktop/dist at compile time, so the frontend comes first.
  TAURI_ENV_PLATFORM=linux bun run build:desktop

  # Device feature selection matches `mold-ai` and `desktopFeaturesFor` in
  # flake.nix: `h3-cuda` on sm89, plain `cuda` on sm120 until FlashAttention
  # is measured there, `cuda,flash-attn` elsewhere.
  local gpu_feature="cuda,flash-attn"
  [[ "${CUDA_COMPUTE_CAP}" == "89" ]] && gpu_feature="h3-cuda"
  [[ "${CUDA_COMPUTE_CAP}" == "120" ]] && gpu_feature="cuda"
  # `tauri/custom-protocol` serves the embedded frontend; without it the app
  # is a dev build that loads devUrl (localhost:1430) and shows a blank window.
  cargo build --release --frozen --offline \
    --manifest-path "${_manifest}" \
    --features "tauri/custom-protocol,${gpu_feature},cudnn,pulid,webp,mesh-texture,mesh-matting,mesh-delight"
}

check() {
  cd "mold-${pkgver}"
  ./scripts/verify-h3-release-exclusion.sh "desktop/src-tauri/target/release/${_binname}"
}

package() {
  cd "mold-${pkgver}"
  # Installs files only; package() never executes the binary (#1742).
  ./scripts/install-linux-desktop-files.sh \
    "desktop/src-tauri/target/release/${_binname}" "${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
