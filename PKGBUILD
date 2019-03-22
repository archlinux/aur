# Contributor: Filip Brcic <brcha@gna.org>

pkgname=mingw-w64-libxml2
pkgver=2.9.9
pkgrel=1
arch=('any')
pkgdesc="XML parsing library, version 2 (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-libiconv' 'mingw-w64-zlib' 'mingw-w64-xz')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://www.xmlsoft.org/"
source=("http://xmlsoft.org/sources/libxml2-${pkgver}.tar.gz")
sha256sums=('94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/libxml2-${pkgver}"

  # disable doc & examples
  sed -i "s| doc example | |g" Makefile.am
  autoreconf -vfi
}

build()
{
  cd "${srcdir}/libxml2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-python
    make

    # deps symbols are not included in static lib:
    ${_arch}-ar x /usr/${_arch}/lib/libiconv.a
    ${_arch}-ar x /usr/${_arch}/lib/liblzma.a
    ${_arch}-ar x /usr/${_arch}/lib/libz.a
    ${_arch}-ar x /usr/${_arch}/lib/libws2_32.a
    ${_arch}-ar cru .libs/libxml2.a *.o 
    ${_arch}-ranlib .libs/libxml2.a

    popd
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "${srcdir}/libxml2-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

