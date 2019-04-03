pkgname=mingw-w64-hmat-oss
pkgver=1.5.0
pkgrel=3
pkgdesc="A hierarchical matrix C/C++ library (mingw-w64)"
license=('GPL')
arch=('any')
url="https://github.com/jeromerobert/hmat-oss"
depends=('mingw-w64-cblas' 'mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha1sums=('ea50bc4ee9eabd42fb81757c5549a2e592a4a434')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/hmat-oss-${pkgver}"

  # https://github.com/jeromerobert/hmat-oss/commit/75727393cc78a20f94b3b6ba445385871504172e
  sed -i '34i#include "cluster_tree.hpp"' src/full_matrix.hpp

  # gcc 8 class-memaccess failure
  sed -i "s|\-Werror ||g" CMakeLists.txt
}


build() {
  cd "$srcdir/hmat-oss-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DINSTALL_INCLUDE_DIR=/usr/${_arch}/include/hmat \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/hmat-oss-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
