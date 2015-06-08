pkgname=mingw-w64-box2d
pkgver=2.3.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games (mingw-w64)"
arch=(any)
url="http://www.box2d.org/"
license=("zlib")
makedepends=('mingw-w64-cmake' 'subversion')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("box2d-$pkgver::svn+http://box2d.googlecode.com/svn/tags/v2.3.1")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/box2d-$pkgver"
}

build() {
  cd "$srcdir/box2d-$pkgver/Box2D"
  unset LDFLAGS
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
    cd "$srcdir/box2d-$pkgver/Box2D/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
