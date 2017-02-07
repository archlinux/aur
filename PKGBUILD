pkgname=mingw-w64-libtasn1
pkgver=4.10
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libtasn1"
license=("GPL3, LGPL")
makedepends=(mingw-w64-configure texinfo)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/gnu/libtasn1/libtasn1-${pkgver}.tar.gz")
md5sums=('f4faffdf63969d0e4e6df43b9679e8e5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/libtasn1-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libtasn1-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
