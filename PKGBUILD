# Maintainer: Bruce Zhang krasjet
pkgname=fontbase
pkgver=2.16.8
pkgrel=1
pkgdesc="FontBase is the font manager of the new generation, built by designers, for designers."
arch=('x86_64' 'i686')
url="https://fontba.se/"
license=('custom:FontBase')
depends=('electron')
makedepends=('p7zip')
source=("$pkgname-$pkgver.AppImage::https://releases.fontba.se/linux/FontBase-$pkgver.AppImage")
md5sums=('6fd5ab1a47c86fc4bd292bc449c6ba9f')

prepare() {
	mkdir -p "$pkgname"
	cd "$srcdir/$pkgname"
	7z x "$srcdir/$pkgname-$pkgver.AppImage"
	echo "https://fontba.se/legal/terms" > "$srcdir/COPYRIGHT"
}

package() {
	cd "$srcdir/$pkgname"

	# Install application
	cd resources/app
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/fontbase/app/{}" \;
	cd ../plugins
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/fontbase/plugins/{}" \;

	# Install start script
	echo "#!/usr/bin/env sh
exec electron /usr/share/fontbase/app/ \$@
" > "$srcdir/fontbase.sh"
	install -Dm755 "$srcdir/fontbase.sh" "$pkgdir/usr/bin/fontbase"

	# Install desktop file
	install -Dm644 "$srcdir/$pkgname/fontbase-app.desktop" "$pkgdir/usr/share/applications/fontbase.desktop"

	# Install license
	install -Dm644 "$srcdir/COPYRIGHT" "$pkgdir/usr/share/licenses/fontbase/COPYRIGHT"

	# Install icons
	cd "$srcdir/$pkgname/usr/share/icons/hicolor"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;
}
