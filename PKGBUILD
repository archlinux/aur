# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
pkgver=3.167.28
pkgrel=1
pkgdesc='Free, open-source encrypted notes app.'
arch=('x86_64' 'aarch64')
url='https://github.com/standardnotes/app'
license=('AGPL3')
depends=('hicolor-icon-theme')
makedepends=('asar')
options=(!strip)
provides=('standardnotes-desktop')
conflicts=('standardnotes-desktop')
install=standardnotes.install
source=("standard-notes.sh")
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::$url/releases/download/%40standardnotes%2Fdesktop%40$pkgver/standard-notes-$pkgver-linux-x86_64.AppImage")
source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::$url/releases/download/%40standardnotes%2Fdesktop%40$pkgver/standard-notes-$pkgver-linux-arm64.AppImage")

sha256sums=('71f0811526d428b541ef39ee804b257ed60b1b9b5d620436c79ed77e17eb4d16')
sha256sums_x86_64=('7185087068bcf795216ec3e6ffd792a2df5d62ae43a1d6f5ef881acc7d05711d')
sha256sums_aarch64=('4cedceb886259e16628871c67cea427f206cd8d543826b6dfafccfec7939d152')

prepare() {
	chmod +x "$pkgname-$pkgver-$CARCH.AppImage"
	"./$pkgname-$pkgver-$CARCH.AppImage" --appimage-extract 2>&1 >/dev/null
	asar e squashfs-root/resources/app.asar squashfs-root/resources/app
	rm squashfs-root/resources/{app.asar,app-update.yml}
}

package() {
	install -dv "$pkgdir/opt/$pkgname/"
	chmod -R 755 squashfs-root/{usr,locales,resources}
	cp -av --no-preserve=ownership squashfs-root/* "$pkgdir/opt/$pkgname/"

	install -Dv "standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
	install -dv "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -dv "$pkgdir/usr/share/applications/"

	sed -i -E '/Exec/c\Exec=env DESKTOPINTEGRATION=false /usr/bin/standard-notes' "$pkgdir/opt/$pkgname/standard-notes.desktop"
	ln -sv "/opt/$pkgname/standard-notes.desktop" "$pkgdir/usr/share/applications/"
	ln -sv "/opt/$pkgname/standard-notes.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
}
