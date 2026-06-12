# Maintainer: James Brink <brink.james@gmail.com>

pkgname=mold-ai
_binname=mold
pkgver=0.12.1
pkgrel=1
pkgdesc="Local AI image generation CLI — FLUX, SD3.5, SD 1.5, SDXL, Z-Image, Flux.2, Qwen-Image, Wuerstchen, LTX Video, & LTX-2 diffusion models on your GPU (built from source, CUDA)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')

depends=('cuda' 'gcc-libs' 'glibc')

optdepends=(
  'nvidia-utils: NVIDIA GPU driver (required for any local GPU generation)'
  'ffmpeg: video output for LTX-Video / LTX-2 (mp4 mux fallback)'
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

# MSRV from workspace.package.rust-version. Bump in lockstep with Cargo.toml.
# `clang` + `lld` + `nasm` mirror the apt deps in .github/workflows/release.yml
# build-linux-sm89 — candle-flash-attn and the H.264 decoder need them.
makedepends=(
  'rust>=1.85'
  'cargo'
  'cuda'
  'clang'
  'lld'
  'nasm'
)

provides=("${pkgname}=${pkgver}")
conflicts=('mold-ai-bin' 'mold-ai-git' 'mold')

# LTO is already `lto = "fat"` in the workspace Cargo.toml; makepkg's outer
# `-flto` flags conflict with that and slow the build for no gain.
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('add0fe21494ad1e2b65e066767e1c75e05cbe5c866f702664615dfa57b7b5210')

prepare() {
  cd "mold-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "mold-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  # Default to Ada Lovelace (sm_89, RTX 40-series). Blackwell users override
  # via `CUDA_COMPUTE_CAP=120 paru -S mold-ai` (paru forwards env vars to
  # makepkg) — see docs at https://github.com/utensils/mold/blob/main/website/guide/installation.md
  export CUDA_COMPUTE_CAP="${CUDA_COMPUTE_CAP:-89}"
  # makepkg runs in a minimal environment and does not source the user's
  # profile, so /opt/cuda/bin (where Arch's `cuda` package puts nvcc) is
  # not on PATH by default. candle's CUDA build needs nvcc at compile time.
  export PATH="/opt/cuda/bin:${PATH}"
  # `${VAR:+:${VAR}}` only prepends the `:` when VAR is set + non-empty.
  # `:${VAR:-}` would expand to a trailing `:` when VAR is unset, which
  # adds an empty entry = CWD to the linker search path.
  export LIBRARY_PATH="/opt/cuda/lib64/stubs${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  # --frozen + --offline pairs with `cargo fetch --locked` above:
  #   --frozen  refuses to mutate Cargo.lock — stale lockfile fails loudly
  #   --offline refuses any network IO — proves the fetch step grabbed
  #             every transitive dep, including build-script deps that
  #             --frozen alone would still allow to download
  # Together they make AUR chroot builds fully reproducible.
  cargo build --release --frozen --offline \
    -p mold-ai \
    --features cuda,preview,expand,tui,webp,mp4,metrics
}

package() {
  cd "mold-${pkgver}"

  install -Dm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d \
    "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_binname} completions bash \
    > "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_binname} completions zsh \
    > "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_binname} completions fish \
    > "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
}
