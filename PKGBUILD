# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-http-parser
_pkgname=http-parser
pkgver=2.9.2
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C (mingw-w64)"
arch=('any')
license=('MIT')
url="https://github.com/nodejs/http-parser"
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nodejs/http-parser/archive/v${pkgver}.tar.gz")
sha512sums=('fe21ba46c9297b55a6382497b689da2af88999a9a5716ffef0731057ce1bb053056e4f20147284c78338e48ed1a793a0270fe0edfe3f4b589926e3ede603d023')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's|-Werror||' Makefile
}

build() {
  CFLAGS="-O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 $CFLAGS"
  CXXFLAGS="-O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 $CXXFLAGS"
  CPPFLAGS="-D_FORTIFY_SOURCE=2 $CPPFLAGS"
  LDFLAGS="-Wl,-O1,--sort-common,--as-needed $LDFLAGS"
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}" && pushd "${srcdir}/build-${_arch}"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}"/. "${srcdir}/build-${_arch}"
    CC=${_arch}-gcc \
    AR=${_arch}-ar \
    RANLIB=${_arch}-ranlib \
    SONAME=libhttp_parser-2.dll \
    LIBNAME=libhttp_parser-2.dll \
    LDFLAGS+=' -Wl,--out-implib=libhttp_parser.dll.a' \
    make -j1 \
    library package
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    mkdir -p ${pkgdir}/usr/${_arch}/{bin,include,lib}
    install -Dm644 http_parser.h "${pkgdir}/usr/${_arch}/include/http_parser.h"
    cp *.a ${pkgdir}/usr/${_arch}/lib/
    cp *.dll ${pkgdir}/usr/${_arch}/bin/
    
    # strip libraries
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
