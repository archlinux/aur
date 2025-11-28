pkgname=mingw-w64-verdict
pkgver=1.4.4
pkgrel=1
pkgdesc="Compute quality functions of 2 and 3-dimensional regions (mingw-w64)"
arch=('any')
url="https://github.com/sandialabs/verdict"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/sandialabs/verdict/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d12d1cd41c6568997df348a72cc2973a662fae1b3634a068ea2201b5f7383186')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/verdict-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DVERDICT_ENABLE_TESTING=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package ()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/verdict-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
