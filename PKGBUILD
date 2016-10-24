# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=imagewriter
pkgver=1.10.1420800585.134a9b3
_release=1.9
pkgrel=7
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/mbarringer/imagewriter'
license=('GPL2')
depends=('qt4' 'udisks2')
optdepends=('xdg-su: NEEDED by non-KDE users!'
	    'kdebase-runtime: provides kdesu')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/suse/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('1187829feeaa2c4289438cc208949d27f9ee088e96eaf8e4a3a903f88f30861ed7f4f8dbb4c4bbcb3f8260f0c9685ed4c1bea1ad165b09df07d99b79ac10b61c')

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
