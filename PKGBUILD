# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
_pkgname="$(echo "$pkgname" | sed 's/.*/\u&/')"
pkgver=2.0.4.6
pkgrel=1
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('qt5-tools')
provides=('ultracopier')
commit=8bdb3a4117cae565994494f9ea3298e7538b6fdb
source=("$pkgname-$pkgver.zip"::"https://github.com/alphaonex86/Ultracopier/archive/$commit.zip")
sha512sums=('f4cf8ac96c298bd8b8b44ae4cbef6478b28a97b9c91cfd23a0c12c05e05c8b252a9ac9ad3896414d3d02b3497400de8cbb5d9f73449f53c09bb4a4909508fa54')

prepare() {
	cd "$srcdir/$_pkgname-$commit"
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_DEBUG/\/\/#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG/\/\/#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/\/\/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$_pkgname-$commit"
	qmake ultracopier.pro
	make
}

package() {
	cd "$srcdir/$_pkgname-$commit"
	install -d "$pkgdir/usr/bin"
	install -Dm755 "ultracopier" "$pkgdir/usr/bin/ultracopier"

	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "resources/ultracopier.desktop" "$pkgdir/usr/share/applications/ultracopier.desktop"
   
	install -d "$pkgdir/usr/share/pixmaps"
	install -Dm644 "resources/ultracopier-128x128.png" "$pkgdir/usr/share/pixmaps/ultracopier.png"
}

