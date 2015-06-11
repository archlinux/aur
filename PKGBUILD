# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=polymer
pkgver=0.3.2
pkgrel=9
pkgdesc="A port of KDE QT style Plastik, which does not depend on any KDE libraries"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php?content=21748"
depends=('qt3')
makedepends=('gcc')
source=(http://www.kde-look.org/CONTENT/content-files/21748-polymer-0.3.2.tar.bz2)
md5sums=('5e566deb55586069378c85cb477f5005')

sed_makefile() {
	sed 's/-I$(QTDIR)\/include/-I\/usr\/include\/qt3/' Makefile > Makefile_new && mv Makefile_new Makefile
}

build() {
	cd $srcdir/polymer-$pkgver

	./configure --prefix=/usr

	cd style
	/usr/bin/qmake-qt3 && sed_makefile
	cd ../config
	/usr/bin/qmake-qt3 && sed_makefile
	cd ..

	export QTDIR=/usr/lib/qt3
	
	make -C style
	make -C config
}

package() {
	cd $srcdir/polymer-$pkgver
	make libdir=$pkgdir/usr/lib/qt3/plugins/styles prefix=$pkgdir/usr install
}
