pkgname=mingw-w64-coin-or-lemon
pkgver=1.3.1
pkgrel=1
pkgdesc="A C++ template library providing many common graph algorithms (mingw-w64)"
arch=('any')
url="http://lemon.cs.elte.hu/trac/lemon"
license=('BSD')
groups=('coin-or')
depends=('mingw-w64-coin-or-cbc' 'mingw-w64-coin-or-clp')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("http://lemon.cs.elte.hu/pub/sources/lemon-${pkgver}.tar.gz")
sha1sums=('b23d64c21b4b9088ad51e85316964a4a4138f82a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/lemon-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DLEMON_ENABLE_GLPK=YES -DLEMON_ENABLE_ILOG=NO -DLEMON_ENABLE_COIN=YES \
      -DLEMON_ENABLE_SOPLEX=no -DGHOSTSCRIPT_EXECUTABLE= \
      -DDOXYGEN_EXECUTABLE= -DPYTHON_EXECUTABLE= .. 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/lemon-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

}

