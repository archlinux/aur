# Maintainer: Benjamin Schaefer <b-schaefer at posteo dot de>
pkgname=kilogui
pkgver=0.1
pkgrel=1
pkgdesc="Graphical interface to program and control the Kilobots via the overhead controller"
url="https://github.com/acornejo/kilogui"
arch=('x86_64')
depends=('libftdi-compat' 'qt4')
source=(
	"https://github.com/acornejo/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname.desktop"
)
sha256sums=(
	'694d1ac9240fed8a7982dc14ca685d8bb00f9c13f229bd35c405f69236c4fbf2'
	'6dd9d63fa50dcc1feb5f696c128712918d5efabed86a267e2d622415d1620ba5'
)

prepare() {
	tar -xf v$pkgver.tar.gz
	cd $pkgname-$pkgver/$pkgname
}

build() {
	cd $pkgname-$pkgver
	make kbsend kbmerge
	cd $pkgname
	qmake-qt4 main.pro	
	make
}

package() {
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/share
	mkdir $pkgdir/usr/share/applications
	install -m 644 $pkgname.desktop $pkgdir/usr/share/applications
	cd $pkgname-$pkgver/
	mkdir $pkgdir/usr/bin
	install -m 755 kbsend $pkgdir/usr/bin
	install -m 755 kbmerge $pkgdir/usr/bin
	install -m 755 kbcompile $pkgdir/usr/bin
	install -m 755 kbprogram $pkgdir/usr/bin
	install -m 755 $pkgname/kilogui $pkgdir/usr/bin
	mkdir $pkgdir/usr/share/pixmaps
	install -m 644 $pkgname/images/$pkgname.png $pkgdir/usr/share/pixmaps
}
