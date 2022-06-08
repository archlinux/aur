# Maintainer: Jacob Parnell <aur@jakepenguins.xyz>
_pkgbin=moderndeck
pkgname=moderndeck-bin
pkgver=9.4.5
pkgrel=1
pkgdesc="A beautiful, powerful Twitter client for desktop."
package="ModernDeck_x86_64.AppImage"
arch=('x86_64')
url='https://moderndeck.org'
license=('MIT')
source=("${package}::https://github.com/dangeredwolf/ModernDeck/releases/download/v${pkgver}/${package}")
sha256sums=('6a90fdc5dbc0795edefa121f43329c4edd6d575abdcfa246b48acfabc9fa44e9')

build() {
	# Extract files from AppImage
	chmod +x "$srcdir/$package"
	$srcdir/$package --appimage-extract

	# Correct .desktop exec command
	sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"

	# Correct app icon path
	mv "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0" "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512"
}

package() {
	install -d "$pkgdir/opt/$_pkgbin"
	cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgbin/"
	chmod -R +rx "$pkgdir/opt/$_pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

	find "$pkgdir" -type d -exec chmod 755 {} +

	install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
}
