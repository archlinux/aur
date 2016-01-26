# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=imagewriter
pkgver=1.10.1420800585.134a9b3
_release=1.5
pkgrel=3
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/mbarringer/imagewriter'
license=('GPL2')
depends=('qt4' 'udisks2')
optdepends=('xdg-su: NEEDED by non-KDE users!'
	    'kdebase-runtime: provides kdesu')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/suse/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('46a0009d3d4448d2750eacd80ca281c9dd0715c1a71f55838b2a52d5a4eed6d06f05aab8252657fefcf7b6f7d898426080c171ac0fe40c6d225964371edf1a80')

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
