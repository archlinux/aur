# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

pkgname=mingw-w64-x86_64-zlib
pkgver=1.3.1
pkgrel=1
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP for amd64 (mingw-w64)"
arch=('x86_64')
license=('Zlib')
depends=(mingw-w64-gcc)
provides=("mingw-w64-$arch-zlib=$pkgver")
conflicts=('mingw-w64-zlib')
url="https://zlib.net/"
source=("https://zlib.net/zlib-$pkgver.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23')

_basename=zlib
_platform="x86_64-w64-mingw32"

build() {
    cd "$srcdir/$_basename-$pkgver"
    ./configure --prefix=/usr/$_platform -shared -static
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
    make  DESTDIR="$pkgdir" install
    find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
    find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g    
    rm -r "$pkgdir/usr/$_platform/share"  
}
