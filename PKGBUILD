pkgname=mingw-w64-box2d
pkgver=2.4.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games (mingw-w64)"
arch=(any)
url="http://www.box2d.org/"
license=("zlib")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/erincatto/Box2D/archive/v${pkgver}.tar.gz")
sha256sums=('d6b4650ff897ee1ead27cf77a5933ea197cbeef6705638dd181adc2e816b23c2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/box2d-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBOX2D_BUILD_TESTBED:BOOL=OFF \
      -DBOX2D_BUILD_UNIT_TESTS:BOOL=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/box2d-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
