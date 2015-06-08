# Contributor: Filip Brcic <brcha@gna.org>

pkgname=mingw-w64-libxml2
pkgver=2.9.2
pkgrel=1
arch=('any')
pkgdesc="XML parsing library, version 2 (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-gettext' 'mingw-w64-zlib')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://www.xmlsoft.org/"
source=("http://xmlsoft.org/sources/libxml2-${pkgver}.tar.gz"
        "mingw32-libxml2-static-build-compile-fix.patch"
        "libxml2-no-test.patch")
md5sums=('SKIP'
         '0df377025082cd93cccbca547f048011'
         'ddd73e88dda6ae318267507409445b7d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/libxml2-${pkgver}"
  patch -Np0 -i "${srcdir}"/mingw32-libxml2-static-build-compile-fix.patch
  patch -Np1 -i "${srcdir}"/libxml2-no-test.patch
  sed -i "s| doc example | |g" Makefile.am
  sed -i "s|LIBXML_STATIC|_WIN32|g" include/libxml/xmlexports.h
  autoreconf -vfi
}

build()
{
  cd "${srcdir}/libxml2-${pkgver}"

  # Static build
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-python \
      --enable-ipv6 \
      --with-modules LIBS="-lz"
    make

    # deps symbols are not included:
    ${_arch}-ar x /usr/${_arch}/lib/libiconv.a
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

    ${_arch}-strip --strip-all "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a

    # Remove documentation
    rm -r "${pkgdir}"/usr/${_arch}/share
    
  done
}

