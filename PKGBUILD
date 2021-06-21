# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
pkgver=3.8.6
pkgrel=2
pkgdesc='A free, open-source and completely encrypted notes app'
arch=('x86_64' 'i686')
url='https://standardnotes.org'
_github='https://github.com/standardnotes/desktop'
_dlurl="$_github/releases/download/v$pkgver"
license=('AGPL3')
_shortname=standard-notes
depends=('hicolor-icon-theme')
makedepends=('asar')
options=(!strip)
provides=('standardnotes-desktop')
conflicts=('standardnotes-desktop')
source=("$_shortname.sh")
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::$_dlurl/$_shortname-$pkgver-linux-x86_64.AppImage")
source_i686=("$pkgname-$pkgver-i686.AppImage::$_dlurl/$_shortname-$pkgver-linux-i386.AppImage")
sha256sums=('71f0811526d428b541ef39ee804b257ed60b1b9b5d620436c79ed77e17eb4d16')
sha256sums_x86_64=('2fbe46d785d38d1c2274902d71856cf52582f33120cd9bfff48522d2ed4cb5f3')
sha256sums_i686=('5866173d4e8aad9c307dc256db5ea3738e1cc26ac9b94f1f1f40c6120185d858')

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

	install -Dm 755 "$_shortname.sh" "$pkgdir/usr/bin/$_shortname"
	install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -d "$pkgdir/usr/share/applications/"

	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_shortname|" "squashfs-root/$_shortname.desktop"
	ln -s "/opt/$pkgname/$_shortname.desktop" "$pkgdir/usr/share/applications/"
	ln -s "/opt/$pkgname/$_shortname.png" "$pkgdir/usr/share/icons/hicolor/512x512/"
}
