pkgname=mingw-w64-agrum
pkgver=0.9.2
pkgrel=1
pkgdesc="C++ Bayesian networks library (mingw-w64)"
license=('GPL')
arch=('any')
url="https://forge.lip6.fr/projects/aGrUM/wiki"
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("agrum-${pkgver}::git+git://forge.lip6.fr/aGrUM#tag=${pkgver}")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd agrum-$pkgver
  sed -i "49i#include <cmath>" src/agrum/core/math/chi2.cpp
}

build() {
  cd agrum-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ../src
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/agrum-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

