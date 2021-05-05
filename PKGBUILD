# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Lubosz <lubosz at gmail dot com>
pkgname=planner-git
pkgver=0.14.6.r166.de43d65
pkgrel=2
pkgdesc="A project management tool for planning, scheduling and tracking projects."
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Planner"
license=('GPL')
depends=('libgnomecanvas' 'gnome-vfs' 'libxslt' 'pygtk')
makedepends=('git' 'gnome-common' 'rarian')
provides=("${pkgname%-git}" 'libplanner-1.so')
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/planner.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^PLANNER_//;s/\([^-]*-\)g/r\1/;s/_/./;s/_/./;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/python/python2/g' tests/python/task-test.py
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHON=/usr/bin/python2
	export CFLAGS=-Wno-error

	NOCONFIGURE=1 ./autogen.sh
	./configure \
		--prefix=/usr \
		--disable-python \
		--disable-gtk-doc \
		--disable-dotnet \
		--disable-update-mimedb \
		--disable-eds-backend \
		--disable-eds \
		--disable-static
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

	# Remove conflicting files
	cd "$pkgdir/usr/share/mime"
	find . -maxdepth 1 -type f -exec rm "{}" \;
}
