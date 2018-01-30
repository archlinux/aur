# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=crusta
_pkgname=CrustaBrowser
pkgver=1.4.3.1
pkgrel=1
pkgdesc="Blazingly fast full feature web browser with unique features"
arch=(x86_64)
url="http://crustabrowser.com/"
license=('GPL3')
depends=('qt5-speech' 'qt5-svg' 'qt5-webengine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CrustaBrowser/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('5181bc8f3677fa31ebf312744577f679e385ad60e88069eed6f45fe774e1f548')

prepare() {
	cd $_pkgname-$pkgver
	sed -i 's/ charts//' $pkgname/crusta.pro
	sed -i 's|QCoreApplication::applicationDirPath()+"|"/usr/share/crusta|
		s|QCoreApplication::applicationDirPath()|"/usr/share/crusta"|' $pkgname/*.cpp
	sed -i 's/Exec=.*/Exec=crusta/
	        s/Icon=.*/Icon=crusta/' Crusta.desktop
}

build() {
	cd $_pkgname-$pkgver/$pkgname
	qmake
	make
}

package() {
	cd $_pkgname-$pkgver
	install -Dm755 $pkgname/crusta "$pkgdir/usr/bin/crusta"
	install -Dm644 $pkgname/res/drawables/icon.svg "$pkgdir/usr/share/pixmaps/crusta.svg"
	install -Dm644 Crusta.desktop "$pkgdir/usr/share/applications/crusta.desktop"
	install -dm755 "$pkgdir/usr/share/crusta/"
	cp -r 3rd_party sidepanel speeddial "$pkgdir/usr/share/crusta/"
}
