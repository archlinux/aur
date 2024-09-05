# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

pkgname=mingw-w64-x86_64-zlib
pkgver=1.3.1
pkgrel=3
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP for amd64 (mingw-w64)"
arch=('x86_64')
license=('Zlib')
makedepends=(mingw-w64-gcc)
provides=("mingw-w64-$arch-zlib=$pkgver")
conflicts=('mingw-w64-zlib')
url="https://zlib.net/"
source=("https://zlib.net/zlib-$pkgver.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23')

_basename=zlib
_platform="x86_64-w64-mingw32"

prepare() {
    cd "$srcdir/$_basename-$pkgver"
    sed -ie "s,dllwrap,${_arch}-dllwrap," win32/Makefile.gcc
    ./configure --prefix=/usr/$_platform -shared -static
}

build() {    
    cd "$srcdir/$_basename-$pkgver"
    make -f win32/Makefile.gcc \
        CC=${_platform}-gcc \
        AR=${_platform}-ar \
        RC=${_platform}-windres \
        STRIP=${_platform}-strip \
        IMPLIB=libz.dll.a \
        CFLAGS="-Wp,-D_FORTIFY_SOURCE=2 -O2 -g -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security -fcf-protection"
}

package () {
    cd    "$srcdir/$_basename-$pkgver"
    install -d "$pkgdir/usr/$_platform/"{bin,include,lib}
    install -m644 -t "$pkgdir/usr/$_platform/include" zlib.h zconf.h
    install -m644 -t "$pkgdir/usr/$_platform/lib" libz.a libz.dll.a
    install -m755 -t "$pkgdir/usr/$_platform/bin" zlib1.dll

    install -d "$pkgdir/usr/$_platform/lib/pkgconfig"
    sed "s,@prefix@,/usr/$_platform,;s,@exec_prefix@,\${prefix},;s,@libdir@,\${exec_prefix}/lib,;s,@sharedlibdir@,\${libdir},;s,@includedir@,\${prefix}/include,;s,@VERSION@,$pkgver," < zlib.pc.in > "$pkgdir/usr/$_platform/lib/pkgconfig/zlib.pc"
    
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    $_platform-strip -x -g "$pkgdir/usr/$_platform/bin/"*.dll
    $_platform-strip -g    "$pkgdir/usr/$_platform/lib/"*.a    
}
