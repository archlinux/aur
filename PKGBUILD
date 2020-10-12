# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
_pkgname="$(echo "$pkgname" | sed 's/.*/\u&/')"
pkgver=2.2.4.7
pkgrel=1
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('qt5-tools')
provides=('ultracopier')
commit=25ff5c5cc5b735bd523bb93325b2160d99664769
source=("$pkgname-$pkgver.zip"::"https://github.com/alphaonex86/Ultracopier/archive/$commit.zip")
sha512sums=('7767532a4cbf7eb6f8cda80667108c55cb3efaa439ea1e939a68fa1e7f8d057bd86c49b1b63b787b3e312db0a8013194a1a5b28485310b2dcb09147596f47370')

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

