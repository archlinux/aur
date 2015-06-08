# Maintainer: Alan Witkowski <alan dot witkowski at gmail dot com>
pkgname=choria
pkgver=0.4.1
pkgrel=1
pkgdesc="2D MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="http://code.google.com/p/choria/"
license=('GPL3')
depends=('gcc-libs' 'irrlicht' 'sqlite')
makedepends=('cmake')
changelog=Changelog
source=("http://choria.googlecode.com/files/$pkgname-$pkgver-src.tar.gz")
sha256sums=('6d1e568ccaf1678a3be9aba4000112d01c2a6f1320f72968ad6ba17043077713')

prepare() {
	cd $srcdir/$pkgname-$pkgver-src

	# script fix
	sed -i 's|/local||' deployment/choria
}

build() {
	cd $srcdir/$pkgname-$pkgver-src
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver-src

	make DESTDIR=$pkgdir install

	# it's a standard license, rm it
	rm $pkgdir/usr/share/doc/$pkgname/license.txt

	# place starting script where it's supposed to be
	install -dm755 $pkgdir/usr/bin
	mv $pkgdir/usr/games/$pkgname $pkgdir/usr/bin/$pkgname
	rmdir $pkgdir/usr/games
}
