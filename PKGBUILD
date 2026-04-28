# Contributor: F Carpano < gmail-com: daert781 >
# Contributor: tee < teeaur at duck dot com >

pkgname=ultracopier
_pkgname=Ultracopier
pkgver=3.0.2.1
pkgrel=1
pkgdesc="Ultracopier acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url='https://ultracopier.herman-brule.com'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tgz::https://github.com/alphaonex86/Ultracopier/archive/$pkgver.tar.gz")
sha256sums=('c232652777e65664fa7e9c8d43187dfd938d69891655f9e9609f16399e7c0699')

prepare() {
	find "$_pkgname-$pkgver" -name "*.ts" -exec lrelease {} \;
}

build() {
	cd "$_pkgname-$pkgver"
	qmake ultracopier.pro \
		QMAKE_CFLAGS="$CFLAGS" \
		QMAKE_CXXFLAGS="$CXXFLAGS" \
		QMAKE_LFLAGS="$LDFLAGS"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	sed -i -e 's/Icon=Ultracopier/Icon=ultracopier/' *.desktop
	# satisfy desktop-file-validate
	sed -i -e '/Path=/d' -e 's/.\<png\>//g' -e '/TerminalOptions=/d' resources/ultracopier.desktop 
	install -Dm644 resources/ultracopier.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 *.desktop -t "$pkgdir/usr/share/kio/servicemenus/"
	install -Dm644 resources/ultracopier-16x16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/ultracopier.png"
	install -Dm644 resources/ultracopier-36x36.png "$pkgdir/usr/share/icons/hicolor/36x36/apps/ultracopier.png"
	install -Dm644 resources/ultracopier-48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ultracopier.png"
	install -Dm644 resources/ultracopier-72x72.png "$pkgdir/usr/share/icons/hicolor/72x72/apps/ultracopier.png"
	install -Dm644 resources/ultracopier-128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ultracopier.png"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

