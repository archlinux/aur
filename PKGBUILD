# Maintainer: James Brink <brink.james@gmail.com>

pkgname=mold-ai-git
_pkgname=mold-ai
_binname=mold
pkgver=0.10.0.r0.g0000000
pkgrel=1
pkgdesc="Local AI image generation CLI — FLUX, SD3.5, SD 1.5, SDXL, Z-Image, Flux.2, Qwen-Image, Wuerstchen, LTX Video, & LTX-2 diffusion models on your GPU (built from main)"
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

makedepends=(
  'git'
  'rust>=1.85'
  'cargo'
  'cuda'
  'clang'
  'lld'
  'nasm'
)

provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}" 'mold-ai-bin' 'mold')

options=(!lto)

source=("mold::git+${url}.git#branch=main")
sha256sums=('SKIP')

# Arch convention for VCS pkgver: <upstream-tag>.r<commits-since-tag>.g<short-sha>
# e.g. 0.10.0.r17.g3fa19b0c
pkgver() {
  cd "mold"
  local tag
  tag="$(git describe --tags --abbrev=0 --match='v*' 2>/dev/null || echo 'v0.0.0')"
  printf '%s.r%s.g%s' \
    "${tag#v}" \
    "$(git rev-list --count "${tag}..HEAD")" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "mold"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "mold"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CUDA_COMPUTE_CAP="${CUDA_COMPUTE_CAP:-89}"
  # makepkg runs in a minimal environment and does not source the user's
  # profile, so /opt/cuda/bin (where Arch's `cuda` package puts nvcc) is
  # not on PATH by default. candle's CUDA build needs nvcc at compile time.
  export PATH="/opt/cuda/bin:${PATH}"
  # `${VAR:+:${VAR}}` only prepends the `:` when VAR is set + non-empty.
  # `:${VAR:-}` would expand to a trailing `:` when VAR is unset, which
  # adds an empty entry = CWD to the linker search path.
  export LIBRARY_PATH="/opt/cuda/lib64/stubs${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  # --frozen + --offline pairs with `cargo fetch --locked` in prepare():
  #   --frozen  refuses to mutate Cargo.lock
  #   --offline refuses any network IO during build
  cargo build --release --frozen --offline \
    -p mold-ai \
    --features cuda,preview,expand,tui,webp,mp4,metrics
}

package() {
  cd "mold"

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
