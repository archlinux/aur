# Maintainer: Jacob Parnell <aur@jakepenguins.xyz>
_pkgbin=moderndeck
pkgname=moderndeck-bin
provides=('moderndeck')
pkgver=10.0.0
pkgrel=1
pkgdesc="A beautiful, powerful Twitter client for desktop."
package_x86_64="ModernDeck-x86_64.AppImage"
package_arm="ModernDeck-arm64.AppImage"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://moderndeck.org'
license=('MIT')
source_x86_64=("${package_x86_64}::https://github.com/dangeredwolf/ModernDeck/releases/download/v${pkgver}/${package_x86_64}")
sha256sums_x86_64=('d74d395e03396137386b50a731799d98813fbd7b8fae37886c6f14a5b9c82517')
source_armv7h=("${package_arm}::https://github.com/dangeredwolf/ModernDeck/releases/download/v${pkgver}/${package_arm}")
source_aarch64=("${package_arm}::https://github.com/dangeredwolf/ModernDeck/releases/download/v${pkgver}/${package_arm}")
sha256sums_armv7h=('22f5bcee1dfd809dfe0a267384c4a56141611d5d97d4e31b1f95999fb1c2b400')
sha256sums_aarch64=('22f5bcee1dfd809dfe0a267384c4a56141611d5d97d4e31b1f95999fb1c2b400')

build() {
	# Extract files from AppImage
	if [[ $CARCH = "x86_64" ]]
	then
		chmod +x "$srcdir/$package_x86_64"
		$srcdir/$package_x86_64 --appimage-extract
	else
		chmod +x "$srcdir/$package_arm"
		$srcdir/$package_arm --appimage-extract
	fi

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
