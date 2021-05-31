pkgname=mingw-w64-expat
pkgver=2.4.1
pkgrel=1
pkgdesc="An XML parser library (mingw-w64)"
arch=(any)
url="http://expat.sourceforge.net"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2")
sha256sums=('2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/expat-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --without-docbook --without-examples --without-tests --without-xmlwf ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/expat-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
