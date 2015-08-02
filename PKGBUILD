pkgname=mingw-w64-libidn
pkgver=1.29
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libidn"
license=("GPL3, LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-gettext)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/gnu/libidn/libidn-${pkgver}.tar.gz")
sha1sums=('e0959eec9a03fd8053379b0aeab447c546c05ab2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libidn-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-csharp --disable-java
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libidn-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/bin/*.def
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
