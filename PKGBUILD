# Maintainer: Ivy Foster <ivy.foster@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname='netsurf-git'
pkgver=3.5.r168.g22d84a5
pkgrel=1
pkgdesc='Lightweight and fast web browser'
url='http://www.netsurf-browser.org/'
license=('MIT' 'GPL2')

depends=('curl' 'desktop-file-utils' 'duktape' 'gtk3' 'lcms' 'libmng' 'librsvg' 
	'libcss-git' 'libdom-git' 'libnsbmp-git' 'libnsgif-git' 'libnsutils-git' 'libutf8proc-git'
)
makedepends=('git' 'inetutils' 'netsurf-buildsystem-git' 'nsgenbind-git')
optdepends=('gstreamer0.10: In-browser video support')
provides=('netsurf')
conflicts=('netsurf')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/netsurf.git' 'Makefile.config')
md5sums=('SKIP'
	'5a7d43ded6a37a02f8079c5ea3c49851'
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
	make -C netsurf PREFIX=/usr TARGET=gtk 
}

package() {
	cd netsurf

	make PREFIX=/usr TARGET=gtk DESTDIR="$pkgdir" install

	install -Dm644 'frontends/gtk/res/netsurf.xpm' \
		"$pkgdir/usr/share/pixmaps/netsurf.xpm"
	install -Dm644 'frontends/gtk/res/netsurf-gtk.desktop' \
		"$pkgdir/usr/share/applications/netsurf.desktop"
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/netsurf-gtk"
}
