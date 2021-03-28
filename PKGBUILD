# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=2.5
pkgrel=18
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/openSUSE/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('ab10119ca9a8222346364a9b9b0225835824a883fe4b8fe6e4b2ff73306c81bd09f87ec34925257021196b4a4c16589649e97abb5c4dcafc5d601656673618bd')

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
