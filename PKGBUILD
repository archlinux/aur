# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto.pro-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('bc817696143a0b4baa32014799c6dd15f5a49f92c9899f931e83082d7df9f54c'
            '4f5ab71609015336302e705a003498836a1164292ce07a9359a5924b54397b02')

prepare() {
	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/clipto.pro/clipto.pro|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	find squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}"
	cp -r squashfs-root/* "$pkgdir/opt/${pkgname%-bin}"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr"
	rm "$pkgdir/opt/${pkgname%-bin}"/{"${pkgname%-bin}".desktop,AppRun}

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
