# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xlog
pkgver=2.0.25
pkgrel=2
pkgdesc="Ham Radio general purpose logging program."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/xlog/"
license=('GPL-3.0-or-later')
depends=('gtk-engine-murrine' 'gtk2>=2.12.0' 'hamlib' 'winkeydaemon' 'hamradio-menus')
optdepends=(	'cwdaemon: serial external-keyer - not usb'
		'glabels: print log')
makedepends=('pkg-config')
# 'libgnomeprint')
source=(http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz
	diff.configure)

prepare() {
	cd $srcdir/$pkgname-$pkgver
	sed -i -e "s:icons:pixmaps:" data/pixmaps/Makefile.in
	patch -p0 < ../diff.configure
}

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr LDFLAGS=-lm
	make

	sed -i -e \
	s:"Categories=Utility;Database;HamRadio;GTK":"Categories=Network;HamRadio;": \
	$srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
	sed -i -e s:'ApplicationHamRadio':'Application': \
	$srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
	sed -i -e s:'xlog-icon.png':'xlog-icon': $srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
	sed -i -e s:'text/x-xlog':'text/x-xlog;': $srcdir/$pkgname-$pkgver/data/desktop/$pkgname.desktop
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install

	rm $pkgdir/usr/share/applications/mimeinfo.cache
#	rm $pkgdir/usr/share/pixmaps/gnome-mime-text-x-xlog.png
}
md5sums=('29733f6a6914178823beee70fd4b4e83'
         '46e099bcef62b854cedbf91ef52e2ada')
sha256sums=('3580b72e0a0b5e72505117194dcdb11cecce95ea2dad6b4e11330181a75fdaa5'
            '46f2eface766047ca0ca238e6afc0ab2f7a6af08548f06c73ef0c0263191d7b8')
