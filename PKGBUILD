# Maintainer: Ivy Foster <ivy.foster@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname='netsurf-git'
pkgver=3.5.r164.g8fdf262
pkgrel=1
pkgdesc='Lightweight and fast web browser'
url='http://www.netsurf-browser.org/'
license=('MIT' 'GPL2')

depends=('curl' 'desktop-file-utils' 'duktape' 'gtk3' 'lcms' 'libmng' 'librsvg' 
	'libcss-git' 'libdom-git' 'libnsbmp-git' 'libnsgif-git' 'libnsutils-git'
)
makedepends=('inetutils' 'netsurf-buildsystem-git')
optdepends=('gstreamer0.10: In-browser video support')
provides=('netsurf')
conflicts=('netsurf')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/netsurf.git'
	'Makefile.config' 'netsurf.sh'
)
sha256sums=('SKIP'
	'057ec874491cb1f6354ae30a3caf75cc26987219d1ebc924c88b460c0e914503'
	'70310682d1612457d7bb3096549110b6ec127f50e97853259fada6be0c52924b'
)

pkgver() {
	cd netsurf
	git describe --always | sed -e 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	cp Makefile.config netsurf
	sed '/BSD_SOURCE/d' -i netsurf/frontends/gtk/Makefile
}

build() {
	cd netsurf
	make PREFIX=/usr TARGET=gtk 
}

package() {
	cd netsurf

	make PREFIX=/usr TARGET=gtk DESTDIR="$pkgdir" install
	mv "$pkgdir/usr/bin/netsurf" "$pkgdir/usr/bin/netsurf.elf"
	install ../netsurf.sh "$pkgdir/usr/bin/netsurf"

	install -Dm644 'frontends/gtk/res/netsurf.xpm' \
		"$pkgdir/usr/share/pixmaps/netsurf.xpm"
	install -Dm644 'frontends/gtk/res/netsurf-gtk.desktop' \
		"$pkgdir/usr/share/applications/netsurf.desktop"
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/netsurf-gtk"
}
