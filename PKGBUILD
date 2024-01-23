pkgname=mingw-w64-zlib
pkgver=1.3.1
pkgrel=1
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP (mingw-w64)"
arch=('any')
license=('Zlib')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
url="http://www.zlib.net/"
source=("http://zlib.net/fossils/zlib-${pkgver}.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    rm -rf "${srcdir}/build-${_arch}"
    cp -r "${srcdir}/zlib-${pkgver}" "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    sed -ie "s,dllwrap,${_arch}-dllwrap," win32/Makefile.gcc
    ./configure --prefix=/usr/${_arch} -shared -static
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
    install -m644 -t "${pkgdir}/usr/${_arch}/lib" libz.a libz.dll.a
    install -m755 -t "${pkgdir}/usr/${_arch}/bin" zlib1.dll

    install -d "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    sed "s,@prefix@,/usr/${_arch},;s,@exec_prefix@,\${prefix},;s,@libdir@,\${exec_prefix}/lib,;s,@sharedlibdir@,\${libdir},;s,@includedir@,\${prefix}/include,;s,@VERSION@,$pkgver," < zlib.pc.in > "${pkgdir}/usr/${_arch}/lib/pkgconfig/zlib.pc"
    
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
