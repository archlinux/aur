# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

pkgname=mingw-w64-x86_64-libiconv
pkgver=1.17
pkgrel=3
arch=('x86_64')
pkgdesc="Provides GNU libiconv.so and libcharset.so for amd64 (mingw-w64)"
depends=()
makedepends=('mingw-w64-gcc')
provides=("mingw-w64-$arch-libiconv=$pkgver")
conflicts=('mingw-w64-libiconv')
options=('!strip' '!buildflags' 'staticlibs')
license=('LGPL-3.0-only')
url="http://www.gnu.org/software/libiconv/"
source=("http://ftp.gnu.org/pub/gnu/libiconv/libiconv-$pkgver.tar.gz")
sha256sums=('8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313')

_basename=libiconv
_platform="x86_64-w64-mingw32"

prepare() {
    cd "$srcdir/$_basename-$pkgver"
    ./configure --host=$_platform --prefix=/usr/$_platform \
        --disable-nls \
        --enable-static
}

build() {
    cd "$srcdir/$_basename-$pkgver"
    make
}

package() {
    cd "$srcdir/$_basename-$pkgver"
    make  DESTDIR="$pkgdir" install
    find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
    find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 chmod 644
    rm -r "$pkgdir/usr/$_platform/share"     
}

