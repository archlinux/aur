# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname='netsurf-git'
pkgver=3.10.r158.gd92b26962
pkgrel=1
pkgdesc='Lightweight and fast web browser'
url='http://www.netsurf-browser.org/'
license=('MIT' 'GPL2')

depends=('curl' 'desktop-file-utils' 'duktape' 'gtk3' 'lcms' 'libmng' 'librsvg'
	'libcss-git' 'libdom-git' 'libnsbmp-git' 'libnsgif-git' 'libnsutils-git' 'libutf8proc-git'
)
makedepends=('git' 'inetutils' 'netsurf-buildsystem-git' 'nsgenbind-git' 'perl-html-parser' 'setconf')
provides=('netsurf')
conflicts=('netsurf')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/netsurf.git')
md5sums=('SKIP')

pkgver() {
	cd netsurf
	git describe --always | sed -e 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed '/BSD_SOURCE/d' -i netsurf/frontends/gtk/Makefile
	
	setconf netsurf/frontends/gtk/res/netsurf-gtk.desktop 'Exec=netsurf-gtk3 %u'
}

build() {
	make -C netsurf \
		NETSURF_UA_FORMAT_STRING='"NetSurf/%d.%d (%s; Arch Linux)"' \
		TARGET=gtk \
		INCLUDEDIR=include \
		LIBDIR=lib \
		PREFIX=/usr -j8
}

package() {
	cd netsurf

	make PREFIX=/usr TARGET=gtk INCLUDEDIR=include LIBDIR=lib DESTDIR="$pkgdir" install

	install -Dm644 'frontends/gtk/res/netsurf.xpm' \
		"$pkgdir/usr/share/pixmaps/netsurf.xpm"
	install -Dm644 'frontends/gtk/res/netsurf-gtk.desktop' \
		"$pkgdir/usr/share/applications/netsurf.desktop"
	install -Dm644 'COPYING' \
		"$pkgdir/usr/share/licenses/netsurf/netsurf-gtk"
}
