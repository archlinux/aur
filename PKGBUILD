# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
pkgver=3.9.3
pkgrel=1
pkgdesc='A free, open-source and completely encrypted notes app'
arch=('x86_64' 'i686')
url='https://standardnotes.org'
license=('AGPL3')
depends=('hicolor-icon-theme')
makedepends=('asar')
options=(!strip)
provides=('standardnotes-desktop')
conflicts=('standardnotes-desktop')
install="$pkgname.install"
source=("standard-notes.sh")
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::https://github.com/standardnotes/desktop/releases/download/v$pkgver/standard-notes-$pkgver-linux-x86_64.AppImage")
source_i686=("$pkgname-$pkgver-i686.AppImage::https://github.com/standardnotes/desktop/releases/download/v$pkgver/standard-notes-$pkgver-linux-i386.AppImage")
sha256sums=('71f0811526d428b541ef39ee804b257ed60b1b9b5d620436c79ed77e17eb4d16')
sha256sums_x86_64=('ad4d8f9ec7043382b1163c545d57f4da7540bfddd50585d35c9f8de49b6ccae0')
sha256sums_i686=('05c6699be5e72cf394836bbd4a26c95f2e76585558c597c7103978e255fac146')

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
