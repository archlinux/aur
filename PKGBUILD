pkgname=mingw-w64-laz-perf
pkgver=1.4.4
pkgrel=1
pkgdesc='Alternative LAZ implementation for C++ and JavaScript (mingw-w64)'
arch=('any')
url='https://github.com/hobu/laz-perf'
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/hobu/laz-perf/archive/${pkgver}.tar.gz")
sha512sums=('2d1016c7d477be2264a9df57b0df822d1e40de033763f12caba0b8a7267826f3278fdfadc81d6ee800a6110af1a53ed9c11ca8173b10dc6b848697c20a70b6eb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/laz-perf-${pkgver}"
  # minwindef.h:131:15: error: conflicting declaration ‘typedef int BOOL’
  sed -i "s|typedef bool               BOOL|typedef int BOOL|g" laz-perf/common/types.hpp
}

build() {
  cd "${srcdir}/laz-perf-${pkgver}"
    for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/laz-perf-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
