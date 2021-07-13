# Maintainer: Prokop Randáček <prokop@randacek.dev>
pkgname=libucw-git
pkgver=v6.5.12.r0.03c6ca57
pkgrel=1
pkgdesc='General purpose library for the C language'
arch=('any')
url="http://www.ucw.cz/libucw/"
license=('LGPL')
depends=(perl bash pkg-config)
makedepends=(perl gcc git pkg-config curl make bash asciidoc)
provides=(libucw)
source=('libucw::git+git://git.ucw.cz/libucw.git#tag=v6.5.12' 'ucw-patch')
md5sums=('SKIP'
         '622cbf9eb33825170d620adf394502fd')

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
	./configure
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

	# inform dynamic linker and pkg-config that there are libraries in `/usr/local/lib/`
	mkdir -p $pkgdir/etc/ld.so.conf.d/
	mkdir -p $pkgdir/etc/profile.d/
	echo "/usr/local/lib/" > $pkgdir/etc/ld.so.conf.d/ucw
	echo 'export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"' > $pkgdir/etc/profile.d/ucw
}

