# Maintainer: M.Reynolds

pkgname=spectools
pkgver=201601R1
_ver=2016-01-R1
pkgrel=1
pkgdesc="Spectools is a set of utilities for using various spectrum analyzer
	hardware. It supports the suite of Wi-Spy devices."
arch=('i686' 'x86_64')
url="https://www.kismetwireless.net/spectools/"
license=('GPL')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk2' 'ncurses' 'pango' 'libusb' 'libusb-compat')
optdepends=('libtinfo: ncurses terminal graphics support')
source=("https://www.kismetwireless.net/code/$pkgname-$_ver.tar.xz" 'spectool_gtk.desktop')
sha256sums=('8d70daaf3b4b71196ca63bbd5df0ef14b82c3b496f63b5cfa434fa637dc08d57'
	'2ec667f8876db43463ef97628e00f2013068dc9139cf32e49ea40d2af77e71af')

build () {
	cd "$srcdir/$pkgname-$_ver"
	CFLAGS="-std=gnu89" ./configure --prefix=/usr
	make
}

package () {
	cd "$srcdir/$pkgname-$_ver"
	make DESTDIR="$pkgdir" install

	sed -i 's/GROUP="plugdev"/GROUP="wheel"/' 99-wispy.rules
	install -Dm 644 99-wispy.rules "$pkgdir/usr/lib/udev/rules.d/99-wispy.rules"
	
	cd "$srcdir"
	install -Dm 644 spectool_gtk.desktop "$pkgdir/usr/share/applications/spectool_gtk.desktop"
}
