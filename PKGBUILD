# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-nettle
pkgver=3.9
pkgrel=1
pkgdesc="A low-level cryptographic library (mingw-w64)"
arch=(any)
url="http://www.lysator.liu.se/~nisse/nettle"
license=("GPL2")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-gmp')
options=('staticlibs' '!strip' '!buildflags')
source=("https://ftp.gnu.org/gnu/nettle/nettle-$pkgver.tar.gz")
sha256sums=('0ee7adf5a7201610bb7fe0acbb7c9b3be83be44904dd35ebbcd965cd896bfeaa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/nettle-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nettle-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

# vim: ts=2 sw=2 et:
