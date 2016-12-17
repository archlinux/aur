pkgname=mingw-w64-box2d
pkgver=2.3.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games (mingw-w64)"
arch=(any)
url="http://www.box2d.org/"
license=("zlib")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/erincatto/Box2D/archive/v${pkgver}.tar.gz")
md5sums=('70e25df706e848dbe611ca5b5c07a4ae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/Box2D-$pkgver/Box2D"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBOX2D_INSTALL:BOOL=ON \
      -DBOX2D_BUILD_EXAMPLES:BOOL=OFF \
      -DBOX2D_BUILD_SHARED:BOOL=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/Box2D-$pkgver/Box2D/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
