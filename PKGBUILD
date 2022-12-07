# -*- mode: Shell-script; eval: (setq tab-width 2) -*-
# Mantainer: Dominic <git at msrd0 dot de>

pkgname=mingw-w64-zlib-static
pkgver=1.2.13
pkgrel=1
pkgdesc="A compression/decompression Library (mingw-w64)"
arch=('any')
license=('custom:zlib')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
conflicts=('mingw-w64-zlib')
provides=("mingw-w64-zlib=$pkgver")
url="http://www.zlib.net/"
source=("http://zlib.net/zlib-${pkgver}.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    rm -rf "${srcdir}/build-${_arch}"
    cp -r "${srcdir}/zlib-${pkgver}" "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    sed -ie "s,dllwrap,${_arch}-dllwrap," win32/Makefile.gcc
    ./configure --prefix=/usr/${_arch} -static
    make -f win32/Makefile.gcc \
      CC=${_arch}-gcc \
      AR=${_arch}-ar \
      RC=${_arch}-windres \
      STRIP=${_arch}-strip \
      IMPLIB=libz.dll.a \
      CFLAGS="-Wp,-D_FORTIFY_SOURCE=2 -O2 -g -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security -fcf-protection"
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -d "${pkgdir}/usr/${_arch}/"{bin,include,lib}
    install -m644 -t "${pkgdir}/usr/${_arch}/include" zlib.h zconf.h
    install -m644 -t "${pkgdir}/usr/${_arch}/lib" libz.a

    install -d "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    sed "s,@prefix@,/usr/${_arch},;s,@exec_prefix@,\${prefix},;s,@libdir@,\${exec_prefix}/lib,;s,@sharedlibdir@,\${libdir},;s,@includedir@,\${prefix}/include,;s,@VERSION@,$pkgver," < zlib.pc.in > "${pkgdir}/usr/${_arch}/lib/pkgconfig/zlib.pc"
    
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
