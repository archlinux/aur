# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034
# -> disable check() until #63 is fixed
DISABLE_CHECK=1

_name=popsift
pkgname=${_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="Realtime GPU implementation of SIFT, 25 fps on HD images on recent graphic cards. (DOI: 10.1145/3204949.3208136)"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
groups=()
conflicts=()
provides=()
makedepends=('boost' 'cmake' 'git')
makedepends+=('cuda>=7.0')
checkdepends=('wget')
options=('staticlibs')
source=("${_name}::git+https://github.com/alicevision/popsift.git")
sha256sums=('SKIP')

_CMAKE_FLAGS=(
              -DCMAKE_INSTALL_PREFIX=/usr
              -DCMAKE_BUILD_TYPE=Release
             )
((BUILD_SHARED))  && _CMAKE_FLAGS+=( -DBUILD_SHARED_LIBS=ON ) || _CMAKE_FLAGS+=( -DBUILD_SHARED_LIBS=OFF -DCUDA_USE_STATIC_CUDA_RUNTIME=ON )
((DISABLE_CHECK)) && _CMAKE_FLAGS+=( -DPopSift_BUILD_EXAMPLES=OFF ) || _CMAKE_FLAGS+=( -DPopSift_BUILD_EXAMPLES=ON -DPopSift_USE_TEST_CMD=ON )

build() {
  cd ${srcdir}

  msg2 "Build PopSift library"
  mkdir -p build && cd build
  cmake ${_CMAKE_FLAGS[@]} ../${_name}
  make
}


package() {
  cd ${srcdir}/build
  ((BUILD_SHARED)) && depends=('boost-libs>=1.55' 'libcudart.so')
  make DESTDIR=${pkgdir} install
}

check() {
  cd ${srcdir}/build
  if ! ((DISABLE_CHECK)); then
    make prepare-test
    make run-test-boat
#   make run-test
  fi
}
# vim:set ts=2 sw=2 et:
