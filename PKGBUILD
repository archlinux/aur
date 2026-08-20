# Contributor: F Carpano < gmail-com: daert781 >
# Contributor: tee < teeaur at duck dot com >

pkgname=ultracopier
_pkgname=Ultracopier
pkgver=3.1.0.3
pkgrel=1
pkgdesc="Ultracopier acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url='https://ultracopier.herman-brule.com'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'hicolor-icon-theme')
makedepends=('qt6-tools')
source=("$pkgname-$pkgver.tgz::https://github.com/alphaonex86/Ultracopier/archive/$pkgver.tar.gz")
b2sums=('18e06d604c2bba8ac8df7401a607260b0cb3ddec0ee6bbdaf45e495bd9e826f4afc5987417d76be886271f9c3a9f07d1b07d2b17eff638caa6c345e4d1cc9c0e')

prepare() {
	find "$_pkgname-$pkgver" -name "*.ts" -exec lrelease {} \;
}

build() {
	cd "$_pkgname-$pkgver"
	# fix  warning: ‘void QCheckBox::stateChanged(int)’ is deprecated: Use checkStateChanged() instead [-Wdeprecated-declarations]
	# sed -i 's|stateChanged|checkStateChanged|' plugins/Themes/Oxygen{,2}/{ThemesFactory,interface}.cpp
	CXXFLAGS+=' -Wno-deprecated-declarations -Wno-conversion'
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

