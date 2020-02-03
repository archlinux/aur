# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.67.2
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
optdepends=('zenity: for dialogs'
            'kdialog: for dialogs'
            'xdialog: for dialogs')
source=("${pkgname%-bin}-$pkgver.AppImage::https://mail.tutanota.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://mail.tutanota.com/desktop/linux-sig.bin"
        'https://raw.githubusercontent.com/tutao/tutanota/master/tutao-pub.pem'
        "${pkgname%-bin}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
replaces=("${pkgname%-bin}-linux")
sha512sums=('16f03e964ef444ca736d0493bfd1063143548df4251c90750a53f53bd298501b04dbf7258d61b2d7d53df9a36e0251db4e3a1750eb716e218568062453780e17'
            '027faf92912ccc3831292989fdc0e5c26b8fe2ff9d6200b34ca8a4c22fc898b444e1245bbb1056e325986ecafab7e08e91b4270ec46b1a8c8b3e327b92be5824'
            '7c6cf9f1074c08b4d38567ced95159c0809af025efe01b0163d9bb5107daabfa873064255186c071a7dc3a9177ccd0c1b2fcc8b085bdbff234965a6710b3ae45'
            '3e6089fae24cfb0bfb210e180427b525730f84b3cb64b5c57fe78e08fcb4292fcd60d15fba93bf9e7ef5c1692170de79cad23236e748308e4372266329140389')

prepare() {
	# Validate the signature against public key: https://tutanota.com/howto/#verify-desktop
	set -e
	openssl dgst -sha512 -verify tutao-pub.pem -signature linux-sig-${pkgver}.bin \
		"${pkgname%-bin}-$pkgver.AppImage"
	set +e

	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/tutanota-desktop/AppRun|g' \
		"squashfs-root/${pkgname%-bin}.desktop"

	# Disable auto-update
	sed -i 's|publishAutoUpdate: true|publishAutoUpdate: false|g' \
		squashfs-root/resources/app-update.yml
}

package() {
	find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}"
	cp -r squashfs-root/* "$pkgdir/opt/${pkgname%-bin}"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr"
	rm "$pkgdir/opt/${pkgname%-bin}/${pkgname%-bin}.desktop"

	# Fix permisssions
	chmod 644 "$pkgdir/opt/${pkgname%-bin}"/resources/app{.asar,-update.yml}

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
