# Maintainer: Martin Poehlmann <mpdeimos@outlook.com>

pkgname=california-git
pkgver=0.3.0.r17.g555974b
pkgrel=1
pkgdesc='A new calendar application for GNOME 3. It is currently under heavy development.'
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/California"
license=('LGPL2.1')
depends=('evolution-data-server' 'libgee' 'xdg-utils' )
makedepends=('vala' 'git' 'intltool' 'gnome-common' 'yelp-tools' 'gobject-introspection')
provides=('california')
conflicts=('california')
install=california.install
source=('git://git.gnome.org/california')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/california"
	git describe --tags --long --match california-* | sed -r 's/^california-//; s/-/.r/; s/-/./'
}

build() {
	cd "$srcdir/california"
	sed -i 's#californiadocdir = ${prefix}#californiadocdir = ${datadir}#g' Makefile.am
	./autogen.sh
	./configure \
		--prefix=/usr
	make
}

package() {
	cd "$srcdir/california"
	make install DESTDIR="$pkgdir"
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
