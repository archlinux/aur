# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: agilob <archlinux@agilob.net>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.66.5
pkgrel=2
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
optdepends=('zenity: for dialogs'
            'kdialog: for dialogs'
            'xdialog: for dialogs')
source=("$pkgname-$pkgver.AppImage::https://mail.tutanota.com/desktop/${pkgname%-bin}-linux.AppImage"
        'https://mail.tutanota.com/desktop/linux-sig.bin'
        'https://raw.githubusercontent.com/tutao/tutanota/master/tutao-pub.pem'
        "${pkgname%-bin}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=("${pkgname%-bin}-linux")
sha512sums=('48c64bdf53bc3575099b3b6bd74900068ac919090f4c79a83941ee920fb3bb59630c0058f841db7c2f14c04f9431c6de736a2162051ed9116a4ce492ede16b29'
            '80c8c3b823bbe793cbf25f742b79d760d5c214496a554dc483fb8e2794dbfab2143e3d41a54e4eedbb1df26b7483cbaf5356bf2a4a14733a1b0fbe42617b232c'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45'
            '3e6089fae24cfb0bfb210e180427b525730f84b3cb64b5c57fe78e08fcb4292fcd60d15fba93bf9e7ef5c1692170de79cad23236e748308e4372266329140389')

prepare() {
	# Validate the signature against public key
	set -e
	openssl dgst -sha512 -verify tutao-pub.pem -signature linux-sig.bin "$pkgname-$pkgver.AppImage"
	set +e

	chmod +x "$pkgname-$pkgver.AppImage"
	./"$pkgname-$pkgver.AppImage" --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/tutanota-desktop/AppRun|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}"
	cp -r squashfs-root/* "$pkgdir/opt/${pkgname%-bin}"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr"

	# Disable autoUpdater
	rm "$pkgdir/opt/${pkgname%-bin}/resources/app-update.yml"

	# Fix permisssions
	chmod 644 "$pkgdir/opt/${pkgname%-bin}/resources/app.asar"

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
