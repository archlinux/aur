# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=imagewriter
pkgver=1.10.1420800585.134a9b3
_release=1.8
pkgrel=6
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/mbarringer/imagewriter'
license=('GPL2')
depends=('qt4' 'udisks2')
optdepends=('xdg-su: NEEDED by non-KDE users!'
	    'kdebase-runtime: provides kdesu')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/suse/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('97f18b778e04db95cdd80e5db36d60f7291624545aa262f4270d4dd221d6b03e062b64962827ece0b4a0540b98482ab80bb9c15534858e37576fd6e34332c886')

prepare() {
	cd $srcdir
	tar xvf $pkgname-$pkgver.tar.xz
	if [ -e /usr/bin/kdesu ]
	  then sed 's/\/usr\/bin\/xdg-su -c \/usr\/bin\//kdesu /' -i $pkgname-$pkgver/$pkgname.desktop
	  else sed 's/\/usr\/bin\/xdg-su -c \/usr\/bin\//xdg-su -s /' -i $pkgname-$pkgver/$pkgname.desktop
	fi
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	CFLAGS="$CFLAGS -DKIOSKHACK"
	qmake-qt4 PREFIX="$pkgdir/usr" DEFINES=USEUDISKS2 $pkgname.pro
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
