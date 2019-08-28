# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034
# -> disable check() until #63 is fixed

_name=popsift
pkgname=${_name}
pkgver=0.9
pkgrel=1
pkgdesc="This library provides a GPU implementation of SIFT, 25 fps on HD images on recent graphic cards. (DOI: 10.1145/3204949.3208136)"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
groups=()
conflicts=()
provides=()
depends=('boost-libs>=1.55' 'cuda=10.1.243-9')
makedepends=('boost' 'cmake' 'git' 'ninja')
checkdepends=('wget')
source=("${_name}::git+https://github.com/alicevision/popsift.git")
sha256sums=('SKIP')

_CMAKE_FLAGS=(
              -DCMAKE_INSTALL_PREFIX=/usr
              -DCMAKE_BUILD_TYPE=Release
              -DBUILD_SHARED_LIBS=ON
             )

((DISABLE_CHECK)) && { _CMAKE_FLAGS+=( -DPopSift_BUILD_EXAMPLES=OFF )
                } || { _CMAKE_FLAGS+=( -DPopSift_BUILD_EXAMPLES=ON
                                       -DPopSift_USE_TEST_CMD=ON    ); }

build() {
  cd ${srcdir}

  msg2 "Build PopSift library"
  mkdir -p build && cd build
  cmake ${_CMAKE_FLAGS[@]} ../${_name}
  make
}


package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

#check() {
#  cd ${srcdir}/build
#  ((DISABLE_CHECK)) || {
#    make prepare-test
#    make run-test
#    make run-test-boat
#  }
#}
# vim:set ts=2 sw=2 et:
