# Maintainer: James Brink <brink.james@gmail.com>
# Maintainer: Jeffrey Dilley <jeff.dilley@gmail.com>

pkgname=mold-ai-bin
_pkgname=mold-ai
_binname=mold
pkgver=0.31.0
pkgrel=1
pkgdesc="Local AI image generation CLI — FLUX, SD3.5, SD 1.5, SDXL, Z-Image, Flux.2, Qwen-Image, Wuerstchen, LTX Video, & LTX-2 diffusion models on your GPU (prebuilt binary, CUDA sm_89 / Ada Lovelace; pulls in extra/cuda ~5 GB)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')

# Runtime deps for the CUDA Linux tarball:
#   - cuda:    cudart / cublas / curand / cusparse / cufft used by candle-kernels
#   - gcc-libs: libstdc++ (candle's CUDA build pulls C++ via nvcc)
#   - glibc:   pulled implicitly; named so future ldd checks have an obvious anchor
# KNOWN GAP (#1742): the release archive is built against CUDA 12.8 and links
# libcudart.so.12, libcublas.so.12, libcublasLt.so.12, libcurand.so.10 and
# libcudnn.so.9, while extra/cuda ships CUDA 13 (libcudart.so.13) and
# extra/cudnn requires cuda>=13. On such a host the installed binary cannot
# load (`ldd /usr/bin/mold` names the missing libraries); a CUDA 12 runtime
# has to come from elsewhere, e.g. the AUR cuda-12.9 + cudnn9.10-cuda12.9
# pair. Nothing in this recipe executes the binary any more, so the package
# itself builds and installs regardless of the builder's loader state.
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
sha256sums_x86_64=('fc564228ae6e183df80835f9553ec6f3c04646c9b35a659a4be81c1631d5b4a6')

package() {
  install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # The release archive ships the shell completions beside the binary
  # (`completions/`), generated at release time from this exact binary and
  # invoked as `mold` so the scripts call back through the user's PATH.
  # Nothing here executes the prebuilt payload: it links the CUDA runtime,
  # and package() runs under fakeroot with whatever loader state the builder
  # happens to have — running `mold completions` here is how 0.30.1 failed
  # with `libcudart.so.12: cannot open shared object file` (#1742).
  if [[ ! -d "${srcdir}/completions" ]]; then
    echo "error: release archive v${pkgver} carries no completions/ directory;" >&2
    echo "       this recipe packages the archives published after v0.30.1, which ship them" >&2
    return 1
  fi
  install -Dm644 "${srcdir}/completions/${_binname}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${srcdir}/completions/_${_binname}" \
    "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${srcdir}/completions/${_binname}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
}
