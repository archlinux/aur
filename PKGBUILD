# Maintainer: kelvie <kelvie@kelvie.ca>
# NOTE: NInfer is compiled exclusively for sm_120a (NVIDIA GeForce RTX 50 series and RTX PRO Blackwell cards, e.g. RTX PRO 6000 Blackwell).
# It will build on any machine with the CUDA toolkit, but the binaries will
# only run on sm_120a hardware.
pkgname=ninfer-git
_pkgbase=ninfer
pkgver=20260824.gfeaf4dd
pkgrel=1
pkgdesc="High-performance single-GPU inference engine for registered Qwen checkpoints (sm_120a only)"
arch=(x86_64)
url="https://github.com/Neroued/ninfer"
license=(Apache-2.0)
provides=(ninfer)
depends=(
  curl
  cuda-toolkit
  ffmpeg
  gcc-libs
  glibc
  nvidia-utils
)
makedepends=(
  cmake
  curl
  cuda-toolkit
  ffmpeg
  git
  ninja
  pkgconf
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  # No upstream tags; use date + short hash of the default branch HEAD.
  printf "%s.g%s" \
    "$(date +%Y%m%d)" \
    "$(git ls-remote "${url}.git" HEAD | cut -c1-7)"
}

build() {
  cmake -S "${_pkgbase}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CUDA_ARCHITECTURES=120a \
    -DNINFER_BUILD_APPS=ON
  cmake --build build
}

package() {
  # Upstream has no install target; install from the build tree.
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "build/apps/ninfer" \
    "build/apps/ninfer-serve"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${_pkgbase}/LICENSE" \
    "${srcdir}/${_pkgbase}/README.md"
}
