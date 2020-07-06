pkgname=mingw-w64-libtasn1
pkgver=4.16.0
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libtasn1"
license=("GPL3, LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/gnu/libtasn1/libtasn1-${pkgver}.tar.gz")
#sha256sums=('7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca'
sha256sums=('0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8d4329d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/libtasn1-${pkgver}
}

build() {
  cd "${srcdir}"/libtasn1-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-doc
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libtasn1-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
