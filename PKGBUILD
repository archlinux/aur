# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=2.4
pkgrel=16
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/openSUSE/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('500a2ffc28de140492077bf8d7af7090f42448c92c56b3653456faddb623fe802b185b59ce5166f2ad6f4f73158ca328d82c61ef81a27480937a0855fcd58456')

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
