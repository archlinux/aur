# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
pkgver=3.20.2
pkgrel=1
pkgdesc='Free, open-source encrypted notes app'
arch=('x86_64' 'i686' 'aarch64')
url='https://standardnotes.org'
license=('AGPL3')
depends=('hicolor-icon-theme')
makedepends=('asar')
options=(!strip)
provides=('standardnotes-desktop')
conflicts=('standardnotes-desktop')
install=standardnotes.install
source=("standard-notes.sh")
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::https://github.com/standardnotes/desktop/releases/download/v$pkgver/standard-notes-$pkgver-linux-x86_64.AppImage")
source_i686=("$pkgname-$pkgver-i686.AppImage::https://github.com/standardnotes/desktop/releases/download/v$pkgver/standard-notes-$pkgver-linux-i386.AppImage")
source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::https://github.com/standardnotes/desktop/releases/download/v$pkgver/standard-notes-$pkgver-linux-arm64.AppImage")
sha256sums=('71f0811526d428b541ef39ee804b257ed60b1b9b5d620436c79ed77e17eb4d16')
sha256sums_x86_64=('0a1119165357e6fd1a832507094cb67821c0410f1da0e5561a6616ddadfa3377')
sha256sums_i686=('feefc2b77cf6a3062e2786e6d4ea86223cc36ba75701875b36c354a2f82546f2')
sha256sums_aarch64=('8605394cbab6c590db45cc0b17cc1c2dea7b4c3cc3ebd79a66394d50fc716914')

prepare() {
	chmod +x "$pkgname-$pkgver-$CARCH.AppImage"
	"./$pkgname-$pkgver-$CARCH.AppImage" --appimage-extract 2>&1 >/dev/null
	asar e squashfs-root/resources/app.asar squashfs-root/resources/app
	rm squashfs-root/resources/{app.asar,app-update.yml}
}

package() {
	install -d "$pkgdir/opt/$pkgname/"
	chmod -R 755 squashfs-root/{usr,locales,resources,swiftshader}
	cp -a --no-preserve=ownership squashfs-root/* "$pkgdir/opt/$pkgname/"

	install -D "standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
	install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -d "$pkgdir/usr/share/applications/"

	sed -i -E '/Exec/c\Exec=env DESKTOPINTEGRATION=false /usr/bin/standard-notes' "$pkgdir/opt/$pkgname/standard-notes.desktop"
	ln -s "/opt/$pkgname/standard-notes.desktop" "$pkgdir/usr/share/applications/"
	ln -s "/opt/$pkgname/standard-notes.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
}
