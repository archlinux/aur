# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto.pro-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
optdepends=('zenity: for dialogs'
            'kdialog: for dialogs'
            'xdialog: for dialogs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('ad9952422c8c5e198e8a12da6eb8426b408963df099b2b1d6966344ba0a65a6b'
            'e868d6a6f625aa77cd9027401ccdf5d0809c8cb221be77bfe7c57802e3890475')


prepare() {
	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/clipto.pro/AppRun|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}"
	cp -r squashfs-root/* "$pkgdir/opt/${pkgname%-bin}"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr"
	rm "$pkgdir/opt/${pkgname%-bin}/${pkgname%-bin}.desktop"

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
