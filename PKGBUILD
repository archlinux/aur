# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=2.3
pkgrel=16
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/openSUSE/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('b731866fba26c0f5fe95c0005b4f4b3125a26d4baf85bf6c8e127e23b3a2046c17bed5a74b524d21d3e12e46f88bd7ca03efb4dd6585bf24a49a486ec5694a3b')

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
