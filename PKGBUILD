# Contributor: F Carpano < gmail-com: daert781 >
# Contributor: tee < teeaur at duck dot com >

pkgname=ultracopier
_pkgname=Ultracopier
pkgver=3.1.0.8
pkgrel=1
pkgdesc="A replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url='https://ultracopier.herman-brule.com'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'hicolor-icon-theme' 'liburing')
makedepends=('qt6-tools')
source=("$pkgname-$pkgver.tgz::https://github.com/alphaonex86/Ultracopier/archive/$pkgver.tar.gz")
b2sums=('ccf806aa7fddea2e512aba3efb7b601cdd8246b16aab44f46becf75ac99309f1d9686d575489be3bde6ef2e4210bda7cab09254b1f29e8a7ff41a0b5fd092222')

prepare() {
	find "$_pkgname-$pkgver" -name "*.ts" -exec lrelease {} \;
}

build() {
	cd "$_pkgname-$pkgver"
	export CXXFLAGS+=' -Wno-deprecated-declarations -Wno-conversion'
	qmake6 ultracopier.pro \
		QMAKE_CFLAGS="$CFLAGS" \
		QMAKE_CXXFLAGS="$CXXFLAGS" \
		QMAKE_LFLAGS="$LDFLAGS"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	sed -i -e 's/Icon=Ultracopier/Icon=ultracopier/' *.desktop
	install -Dm644 *.desktop -t "$pkgdir/usr/share/kio/servicemenus/"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	cd resources
	# satisfy desktop-file-validate
	sed -i -e '/Path=/d' -e 's/.\<png\>//g' -e '/TerminalOptions=/d' ultracopier.desktop 
	install -Dm644 ultracopier.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 ultracopier-16x16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/ultracopier.png"
	install -Dm644 ultracopier-36x36.png "$pkgdir/usr/share/icons/hicolor/36x36/apps/ultracopier.png"
	install -Dm644 ultracopier-48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ultracopier.png"
	install -Dm644 ultracopier-72x72.png "$pkgdir/usr/share/icons/hicolor/72x72/apps/ultracopier.png"
	install -Dm644 ultracopier-128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ultracopier.png"
}

