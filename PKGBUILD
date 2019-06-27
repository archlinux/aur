# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-nettle
pkgver=3.5.1
pkgrel=1
pkgdesc="A low-level cryptographic library (mingw-w64)"
arch=(any)
url="http://www.lysator.liu.se/~nisse/nettle"
license=("GPL2")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-gmp')
options=('staticlibs' '!strip' '!buildflags')
source=("http://www.lysator.liu.se/~nisse/archive/nettle-$pkgver.tar.gz")
sha256sums=('75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419')

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
