# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
pkgver=1.6.1.2
pkgrel=2
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
provides=('ultracopier')
commit=df284b09193a72f4562a1e0ec20e643172797f1f
source=("${pkgname}::git+https://github.com/alphaonex86/Ultracopier#commit=${commit}"
        "ultracopier.desktop"
)
sha512sums=('SKIP'
            '76fa620b2f42bec3b127c8cc02564e9b3aee75d94267cef717f1f752802c4092b45897603451aab5a8d65f76392ef36818bfceea427527ebd90334f2fa520fab')

prepare() {
	cd "$srcdir/$pkgname"
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_DEBUG/\/\/#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG/\/\/#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/\/\/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$pkgname"
	qmake ultracopier.pro
	make
}

package() {
	install -d "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/ultracopier" "$pkgdir/usr/bin/ultracopier"

	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/ultracopier.desktop" "$pkgdir/usr/share/applications/ultracopier.desktop"
   
	install -d "$pkgdir/usr/share/pixmaps"
	install -Dm644 "$srcdir/$pkgname/resources/ultracopier-128x128.png" "$pkgdir/usr/share/pixmaps/ultracopier.png"
}

