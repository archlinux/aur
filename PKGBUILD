# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=('electron')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}.pro")
replaces=("${pkgname%-bin}.pro")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('cd5b371d73def6b3cfd83ffd91c24955f2d6722f2c80c0508c490fcbd46287d5'
            '9a741f1a1760de706698cb1576e3bb08846876c359aedd5d8854e69d913f0635')

prepare() {
	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

	sed -i 's|Exec=AppRun|Exec=clipto|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	cd "$srcdir/squashfs-root"
	find {locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/usr/lib/${pkgname%-bin}"
	cp -r resources "$pkgdir/usr/lib/${pkgname%-bin}"

	install -Dm755 "$srcdir/${pkgname%-bin}" -t "$pkgdir/usr/bin"

	install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/icons"
	cp -r usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
