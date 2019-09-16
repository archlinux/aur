# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=clipto.pro-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=('libxss' 'nss' 'gtk3')
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('d1aeeec812d1037d5accee54c1dbd8e820548471f393d7eddba80f2548e60cad'
            'e868d6a6f625aa77cd9027401ccdf5d0809c8cb221be77bfe7c57802e3890475')


prepare() {
	chmod +x "${pkgname%-bin}-$pkgver.AppImage"
	./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract
	sed -i 's|Exec=AppRun|Exec=/opt/clipto.pro/AppRun|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	find squashfs-root/locales/ -type d -exec chmod 755 {} +
	find squashfs-root/resources/ -type d -exec chmod 755 {} +
	install -d "$pkgdir/opt/${pkgname%-bin}"
	cp -r squashfs-root/* "$pkgdir/opt/${pkgname%-bin}"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr"
	
	install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	
	install -Dm644 "squashfs-root/${pkgname%-bin}.desktop" \
		"$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
	
	find squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
	install -d "$pkgdir/usr/share/icons"
	cp -r squashfs-root/usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}
