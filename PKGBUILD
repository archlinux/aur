
pkgname=mingw-w64-plib
pkgver=1.8.5
pkgrel=1
pkgdesc="Set of libraries to write games and other realtime interactive applications (mingw-w64)"
arch=('any')
url="http://plib.sourceforge.net/"
license=('custom:LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
source=("http://plib.sourceforge.net/dist/$pkgname-$pkgver.tar.gz")
options=('staticlibs' '!strip' '!buildflags')
sha256sums=('485b22bf6fdc0da067e34ead5e26f002b76326f6371e2ae006415dea6a380a32')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_architectures="i686-w64-mingw32"

build() {
  cd "${srcdir}/plib-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/plib-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
#     ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
