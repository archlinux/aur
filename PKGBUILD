pkgname=mingw-w64-expat
pkgver=2.5.0
pkgrel=1
pkgdesc="An XML parser library (mingw-w64)"
arch=(any)
url="http://expat.sourceforge.net"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2")
sha512sums=('22fd904d75aab7506a85c03519b9cf79e44898c8e1ba6abf6cb7f95de71b8e63a7e2d5cf4395e3627d46035ea29342b3e631a8809fef8aad3f59976dc075ad17')

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
