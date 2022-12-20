# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
_pkgname="$(echo "$pkgname" | sed 's/.*/\u&/')"
pkgver=2.2.6.4
pkgrel=1
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('qt5-tools')
provides=('ultracopier')
commit=a2fbe816108d89761678fec9974e6977eeda9e92
source=("$pkgname-$pkgver.zip"::"https://github.com/alphaonex86/Ultracopier/archive/$commit.zip")
sha256sums=('dc9100156886d371a81e62ba91542b0e36ad9a62b41e05c67e8fd555ff340e7f')

prepare() {
	cd "$srcdir/$_pkgname-$commit"
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_DEBUG/\/\/\#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG/\/\/\#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/\/\/\#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$_pkgname-$commit"
	qmake ultracopier.pro \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
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

