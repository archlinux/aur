# Maintainer: Ruiqi Niu <rniu5 at jh dot edu>

pkgname=cad2fbd
pkgver=1.1
pkgrel=2
pkgdesc='CAD-geometry (STEP or IGES) to CalculiX FBD converter by Pascal Mossier.'
url=http://www.dhondt.de/
license=('GPL-2.0-only')
arch=('x86_64')
depends=(
	'opencascade'
)
makedepends=(
	'imake'
	'make'
	'gcc'
)
options=(
	'!buildflags'
	'!debug'
)
source=(
	"http://www.dhondt.de/cgxCadTools.tar.bz2"
)
md5sums=(
	'd9dacdaa2776dc9e24fa17084e0a237f'
)

prepare() {
	cd $srcdir/cgxCadTools/CadReader/src

	cp Makefile_orig Makefile
	sed -i "/^OCCT =/c\OCCT = /usr/lib" Makefile
	sed -i "/^OCCINC =/c\OCCINC = /usr/include/opencascade" Makefile
	sed -i "/^PROGPATH =/c\PROGPATH = $srcdir\/cgxCadTools\/CadReader" Makefile
	sed -i "/^CFLAGS =/c\CFLAGS = -std=c++11 -O3" Makefile
	sed -i "/^MAIN =/c\MAIN = $pkgname" Makefile

	make depend
	make clean
}

build() {
	cd $srcdir/cgxCadTools/CadReader/src

	make -j$(($(nproc) - 1))
}

package() {
	install -Dm755 $srcdir/cgxCadTools/CadReader/src/$pkgname $pkgdir/usr/bin/$pkgname
}

