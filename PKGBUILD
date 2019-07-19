# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=1.6
pkgrel=7
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/mbarringer/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
optdepends=('xdg-su: NEEDED by non-KDE users!'
	    'kdesu: privilege elevation for KDE users')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('38106c68f1e8788133a4974e15969e60f5bb744d42fdeb9eaeeeaf22d6f349b1b1d4d31a77962f504af89286874a9e8663e36a24f702856aac3953fd76bc5802')

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
