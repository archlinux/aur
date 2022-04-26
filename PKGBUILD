# Maintainer: Jacob Parnell <aur@jakepenguins.xyz>
_pkgbin=moderndeck
pkgname=moderndeck-bin
pkgver=9.4.4
pkgrel=1
pkgdesc="A beautiful, powerful Twitter client for desktop."
package="ModernDeck_x86_64.AppImage"
arch=('x86_64')
url='https://moderndeck.org'
license=('MIT')
source=("${package}::https://github.com/dangeredwolf/ModernDeck/releases/download/v${pkgver}/${package}")
sha256sums=('5c443686107f09d632ed8917e6ef9a80b6b65ee25cb40ff1aef79dd24acb3394')

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
