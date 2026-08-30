# Maintainer: James Brink <brink.james@gmail.com>
# Maintainer: Jeffrey Dilley <jeff.dilley@gmail.com>

pkgname=mold-ai-bin
_pkgname=mold-ai
_binname=mold
pkgver=0.26.0
pkgrel=1
pkgdesc="Local AI image generation CLI — FLUX, SD3.5, SD 1.5, SDXL, Z-Image, Flux.2, Qwen-Image, Wuerstchen, LTX Video, & LTX-2 diffusion models on your GPU (prebuilt binary, CUDA sm_89 / Ada Lovelace; pulls in extra/cuda ~5 GB)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')

# Runtime deps for the CUDA Linux tarball:
#   - cuda:    cudart / cublas / curand / cusparse / cufft used by candle-kernels
#   - gcc-libs: libstdc++ (candle's CUDA build pulls C++ via nvcc)
#   - glibc:   pulled implicitly; named so future ldd checks have an obvious anchor
# nvidia-driver is intentionally *not* a depend — users with non-NVIDIA Arch boxes
# can still install the package (the binary just exits at runtime); declaring it
# as a hard dep would block valid use cases (CPU-only model browsing, server-mode
# clients talking to a remote `mold serve`).
depends=('cuda' 'gcc-libs' 'glibc')

optdepends=(
  'nvidia-utils: NVIDIA GPU driver (required for any local GPU generation)'
  'ffmpeg: video output for LTX-Video / LTX-2 (mp4 mux fallback)'
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

# Tells pacman this satisfies `mold-ai`. `conflicts` covers:
#   - the other AUR variants (only one can be installed at a time)
#   - extra/mold (the rui314 linker), which also installs /usr/bin/mold — without
#     this entry pacman would still refuse the install with a file conflict, but
#     declaring it up front is clearer and skips makepkg's lint warning.
provides=("${_pkgname}=${pkgver}")
conflicts=('mold-ai' 'mold-ai-git' 'mold')

# Release tarball ships an already-stripped binary (see profile.release in
# Cargo.toml: strip = true). Re-stripping is a no-op.
options=(!strip)

# mold publishes four CUDA variants per Linux release. We default to sm_89
# (RTX 40-series / Ada Lovelace) because that's the widest install base on
# Arch right now and changing the existing package's artifact would be
# surprising. RTX 3090/A40 (sm_86), B200/B300 (sm_100), and RTX 50-series
# (sm_120) users should install via the source PKGBUILD with the matching
# CUDA_COMPUTE_CAP, or pull the matching tarball manually. There is no
# mold-ai-bin-sm100 package until B200 completes real hardware qualification.
#   https://github.com/utensils/mold/releases/download/v${pkgver}/mold-x86_64-unknown-linux-gnu-cuda-sm120.tar.gz
# Arch-agnostic source for the LICENSE file (release tarballs don't carry it).
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_binname}-x86_64-unknown-linux-gnu-cuda-sm89.tar.gz")

# Rewritten by scripts/aur/update-pkgbuild.sh on every release.
sha256sums=('cd904e73d29dc7d62178ebc6def9e500c6b176e8e4c40f58e4b0b5f008380311')
sha256sums_x86_64=('cc571f62c7ca8fc757ec356dd8b763e8f77ee94acae1c27faf27ad0b52fd0bbe')

package() {
  install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # `mold completions <shell>` is a `clap_complete` script generator. Invoke
  # via PATH so argv[0] == "mold" — the generated scripts call back through
  # the user's PATH at runtime instead of a baked-in $pkgdir path (which
  # makepkg's lint_package would flag).
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
