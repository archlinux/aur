# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto-bin
pkgver=3.3.1
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
sha256sums=('f6fc9765fa00a7d1e5472e68ea98546fa58b18e883431aa45ec821873d8f954f'
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
