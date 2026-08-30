# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=bankai-bin
pkgver=0.2.90
pkgrel=1
pkgdesc="Focused Electron workspace for persistent project shell sessions"
arch=('x86_64')
url="https://github.com/juicerq/bankai"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libnotify' 'hicolor-icon-theme' 'git')
makedepends=('imagemagick')
provides=('bankai')
conflicts=('bankai')
options=('!strip' '!debug')
source=("bankai-$pkgver.AppImage::$url/releases/download/v$pkgver/Bankai-$pkgver.AppImage")
noextract=("bankai-$pkgver.AppImage")
sha256sums=('1a96a0a8f19f87b5652dd591246f61128b0fb3b02e655ef6924bd5870a6a2328')

prepare() {
	chmod +x "bankai-$pkgver.AppImage"
	"./bankai-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
	install -d "$pkgdir/opt/bankai"
	cp -a squashfs-root/. "$pkgdir/opt/bankai/"

	rm -f "$pkgdir/opt/bankai/AppRun" "$pkgdir/opt/bankai/bankai.desktop" "$pkgdir/opt/bankai/bankai.png" "$pkgdir/opt/bankai/.DirIcon"
	rm -rf "$pkgdir/opt/bankai/usr"

	find "$pkgdir/opt/bankai" -type d -exec chmod 755 {} +

	chmod 4755 "$pkgdir/opt/bankai/chrome-sandbox"

	install -d "$pkgdir/usr/bin"
	ln -s /opt/bankai/bankai "$pkgdir/usr/bin/bankai"

	for size in 128 256 512; do
		magick "$srcdir/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/bankai.png" \
			-resize "${size}x${size}" "$srcdir/bankai-$size.png"
		install -Dm644 "$srcdir/bankai-$size.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/bankai.png"
	done

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/bankai.desktop" <<-EOF
		[Desktop Entry]
		Name=Bankai
		Comment=$pkgdesc
		Exec=bankai %U
		Icon=bankai
		Terminal=false
		Type=Application
		Categories=Utility;
		StartupWMClass=Bankai
	EOF
}
