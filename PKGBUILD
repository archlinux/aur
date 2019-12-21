# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=clipto.pro-bin
pkgver=1.8.5
pkgrel=2
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
sha256sums=('bbfabf6d601643204c75c211ba4646256aca7927106cf227f4d6a9808b95e3dc'
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

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
