# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

_name=libgnurx
_platform=x86_64-w64-mingw32

pkgname=mingw-w64-x86_64-$_name
pkgver=2.5.1
pkgrel=1
arch=(x86_64)
pkgdesc="regex functionality from glibc for amd64 platform (mingw-w64)"
makedepends=(mingw-w64-gcc)
provides=($pkgname=$pkgver)
conflicts=('mingw-w64-regex' 'mingw-w64-libgnurx')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL-2.1-only')
url="https://sourceforge.net/projects/mingw/"
source=("http://download.sourceforge.net/mingw/Other/UserContributed/regex/mingw-regex-$pkgver/mingw-$_name-$pkgver-src.tar.gz"
        "mingw-w64-libgnurx-honor-destdir.patch")
md5sums=('35c8fed3101ca1f253e9b6b1966661f6'
         '2d87c59177adf5ec13dbcc02acc4a450')

prepare() {
	cd "$srcdir/mingw-$_name-$pkgver"
	patch -Np0 -i ../mingw-w64-libgnurx-honor-destdir.patch
}

build() {
	cd "$srcdir/mingw-$_name-$pkgver"
	./configure --host=$_platform --prefix=/usr/$_platform \
		--enable-shared \
		--enable-static
	make
}

package() {
	cd    "$srcdir/mingw-$_name-$pkgver"
	make  DESTDIR="$pkgdir" install
    find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
    find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 chmod 644
    rm -r "$pkgdir/usr/$_platform/man"    	
}

