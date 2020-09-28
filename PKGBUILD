# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=1.10
pkgrel=14
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64', 'aarch64')
url='https://github.com/openSUSE/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('cbea133ff9d0ab4762300085df8f678809d3399f89bab76d6231e1f9ecdcc1ca8c30a7aea1f5a5e2d90556068ce83f3777c0534a89f2f14556f282df61683801')

prepare() {
	cd $srcdir
	tar xvf $pkgname-$pkgver.tar.xz
	find . -name '*.cpp' -exec sed -i -e '/sysctl.h/d' {} \;
	find . -type f -exec sed -i 's/toAscii/toLatin1/g' {} \;
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
