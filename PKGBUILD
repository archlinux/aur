# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=1.5
pkgrel=6
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/mbarringer/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
optdepends=('xdg-su: NEEDED by non-KDE users!'
	    'kdesu: privilege elevation for KDE users')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('dc41f1b4cd36915a27e9ecf59f466c07d70d86d99d2bd1b081ea54123411fb174a1c1f5b80174a3562112901866eb636832451e7fd217be775a868a61f47ebb2')

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
	qmake-qt5 PREFIX="$pkgdir/usr" DEFINES=USEUDISKS2 $pkgname.pro
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
