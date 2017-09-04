pkgname=mingw-w64-libtasn1
pkgver=4.12
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libtasn1"
license=("GPL3, LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/gnu/libtasn1/libtasn1-${pkgver}.tar.gz"
        0001-Rename-gnulib-symbols.patch)
md5sums=('5c724bd1f73aaf4a311833e1cd297b21'
         'b966fbc667038870bd472b38b086e79f')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/libtasn1-${pkgver}
  # https://cgit.freedesktop.org/gstreamer/cerbero/tree/recipes/libtasn1/0001-Rename-gnulib-symbols.patch
  patch -p1 -i "${srcdir}"/0001-Rename-gnulib-symbols.patch
  autoreconf -vfi
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
