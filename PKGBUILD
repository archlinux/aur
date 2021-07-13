# Maintainer: Prokop Randáček <prokop@randacek.dev>
pkgname=libucw-git
pkgver=v6.5.12.r0.03c6ca57
pkgrel=1
pkgdesc='General purpose library for the C language'
arch=('x86_64')
url="http://www.ucw.cz/libucw/"
license=('LGPL')
depends=(perl bash pkg-config)
makedepends=(perl gcc git pkg-config curl make bash asciidoc)
provides=(libucw)
source=('libucw::git+git://git.ucw.cz/libucw.git#tag=v6.5.12' 'ucw-patch')
md5sums=('SKIP'
         'ef8bd4a7a041c20320d59db468241f44')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git apply ../ucw-patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure PREFIX=/usr CONFIG_DIR=/etc LOPT=-Wl,-z,relro,-z,now
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
