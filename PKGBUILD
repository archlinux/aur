# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop-bin
pkgver=3.76.7
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
makedepends=('openssl')
source=("${pkgname%-bin}-$pkgver.AppImage::https://mail.tutanota.com/desktop/${pkgname%-bin}-linux.AppImage"
        "linux-sig-$pkgver.bin::https://mail.tutanota.com/desktop/linux-sig.bin"
        'https://raw.githubusercontent.com/tutao/tutanota/master/tutao-pub.pem'
        "${pkgname%-bin}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-linux")
replaces=("${pkgname%-bin}-linux")
sha512sums=('9fbf9bfc083b022047b42b631b7bac4c3bfe68c3a7320a6cbcaadf7a17790ce75d9f490f5660ec8ed09259a48dd356836b6e7a061528925fdbf84af4c8df3e60'
            '28449010d10c5882df36d1f1cc4e6491ee373e325a5127d901266e817f7eaf5dbb25411c8b33310103721df2587cd6397bc5ff53155ddd4c876fbbb9335f46d6'
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
