# Maintainer: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=spectools
pkgver=2016.01.R1
_ver=2016-01-R1
pkgrel=2
pkgdesc="A set of utilities for spectrum analyzer hardware including Wi-Spy devices."
arch=('i686' 'x86_64')
url="https://www.kismetwireless.net/spectools/"
license=('GPL')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk2' 'ncurses' 'pango' 'libusb' 'libusb-compat')
optdepends=('libtinfo: ncurses terminal graphics support')
source=("https://www.kismetwireless.net/code/$pkgname-$_ver.tar.xz" 'spectool_gtk.desktop')
sha256sums=('8d70daaf3b4b71196ca63bbd5df0ef14b82c3b496f63b5cfa434fa637dc08d57'
	'898556167d323e847fa82f2236a0d859a2c796109cebf08b1a85c27df9ad50da')

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
