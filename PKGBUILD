pkgname=mingw-w64-x86_64-libxml2
pkgver=2.13.3
pkgrel=1
arch=('x86_64')
pkgdesc="XML parsing library, version 2 for amd64 (mingw-w64)"
depends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
provides=("mingw-w64-$arch-libxml2=$pkgver")
conflicts=('mingw-w64-libxml2')
url="http://www.xmlsoft.org/"
source=("https://download.gnome.org/sources/libxml2/${pkgver::4}/libxml2-${pkgver}.tar.xz")
sha256sums=('0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138')

_basename=libxml2
_platform="x86_64-w64-mingw32"

prepare () {
	cd "$srcdir/$_basename-$pkgver"

	# disable doc & examples
	sed -i "s| doc example | |g" Makefile.am
	autoreconf -vfi
}

build() {
	cd "$srcdir/$_basename-$pkgver"
	./configure --host=$_platform --prefix=/usr/$_platform --without-python
	make
}

package() {
    cd "$srcdir/$_basename-$pkgver"
    make  DESTDIR="$pkgdir" install
    find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
    find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g
	rm 	  "$pkgdir/usr/$_platform/bin/xml2-config"
    rm -r "$pkgdir/usr/$_platform/share" 
}
