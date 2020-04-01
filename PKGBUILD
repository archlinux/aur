# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.69.5
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
source=("${pkgname%-bin}-$pkgver.AppImage::https://mail.tutanota.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://mail.tutanota.com/desktop/linux-sig.bin"
        'https://raw.githubusercontent.com/tutao/tutanota/master/tutao-pub.pem'
        "${pkgname%-bin}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
replaces=("${pkgname%-bin}-linux")
sha512sums=('2a28a42f90febe8959960f471e14de720cb62b5269969cf2fc68c7c0f1a77bb92a82404416d9dc8f55f2a3e2c2bc97872a62085575166a328610afd79f7916ae'
            'de6d1145c0817e242964d5ad9a31cb3010ba2f6a70d76f59d9c74e96ce73dd1d8301fa529f8117e6b5f0c92660268c117723c8473a686b43068b7411b90767a5'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45'
            '373e1be50297177306ba2f6898fbb57e12b8360af5fb575b2711179e0e952b8e4e9de1d4a66675e441fbe7f8dd5c63d3bddf9114f6e3be95adb49703e597137f')

prepare() {
	# Validate the signature against public key: https://tutanota.com/howto/#verify-desktop
	openssl dgst -sha512 -verify tutao-pub.pem -signature linux-sig-${pkgver}.bin \
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
