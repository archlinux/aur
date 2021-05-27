# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.84.0
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libappindicator-gtk3' 'libnotify' 'org.freedesktop.secrets')
makedepends=('openssl')
source=("${pkgname%-bin}-$pkgver.AppImage::https://mail.tutanota.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://mail.tutanota.com/desktop/linux-sig.bin"
        "tutao-pub-$pkgver.pem::https://github.com/tutao/tutanota/raw/tutanota-release-$pkgver/tutao-pub.pem"
        "${pkgname%-bin}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
replaces=("${pkgname%-bin}-linux")
sha512sums=('65c5dc3954c25d1114113ab6a1ee0af751223ed8bc430a157adc04a2952d530ed313ea3fdad73b912788d273fc1c5be4a23b6581718ff3141117cece10bd434e'
            '95b9acb3197cfa778a2c15f687504c0582072cb50448760764683d55e2595ca33abe8b14405a28ba2ae6e24a0f6c601e9b7a93e515d74fbda18b21aa7ee2b49f'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45'
            '373e1be50297177306ba2f6898fbb57e12b8360af5fb575b2711179e0e952b8e4e9de1d4a66675e441fbe7f8dd5c63d3bddf9114f6e3be95adb49703e597137f')

prepare() {
	# Validate the signature against public key: https://tutanota.com/howto/#verify-desktop
	openssl dgst -sha512 -verify tutao-pub-$pkgver.pem -signature linux-sig-${pkgver}.bin \
		"${pkgname%-bin}-$pkgver.AppImage"

	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

	# Correct path for .desktop file
	sed -i 's|Exec=AppRun|Exec=/opt/tutanota-desktop/tutanota-desktop|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}"
	cp -r squashfs-root/* "$pkgdir/opt/${pkgname%-bin}"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr"
	rm "$pkgdir/opt/${pkgname%-bin}"/{"${pkgname%-bin}".desktop,AppRun}

	# Fix permisssions
	chmod 644 "$pkgdir/opt/${pkgname%-bin}"/resources/app{.asar,-update.yml}

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
