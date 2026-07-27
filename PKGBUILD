# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=bankai-bin
pkgver=0.2.30
pkgrel=1
pkgdesc="Focused Electron workspace for persistent project shell sessions"
arch=('x86_64')
url="https://github.com/juicerq/bankai-2"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libnotify' 'hicolor-icon-theme' 'git')
provides=('bankai')
conflicts=('bankai')
options=('!strip' '!debug')
source=("bankai-$pkgver.AppImage::$url/releases/download/v$pkgver/Bankai-$pkgver.AppImage")
noextract=("bankai-$pkgver.AppImage")
sha256sums=('1ecd6ae8e6fcbc5179086906ed8cccb7f80ac4a93808f12bf7225432e5cf442e')

prepare() {
	chmod +x "bankai-$pkgver.AppImage"
	"./bankai-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
	install -d "$pkgdir/opt/bankai"
	cp -a squashfs-root/. "$pkgdir/opt/bankai/"

	rm -f "$pkgdir/opt/bankai/AppRun" "$pkgdir/opt/bankai/bankai.desktop" "$pkgdir/opt/bankai/bankai.png" "$pkgdir/opt/bankai/.DirIcon"
	rm -rf "$pkgdir/opt/bankai/usr"

	chmod 4755 "$pkgdir/opt/bankai/chrome-sandbox"

	install -d "$pkgdir/usr/bin"
	ln -s /opt/bankai/bankai "$pkgdir/usr/bin/bankai"

	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/bankai.png" \
		"$pkgdir/usr/share/icons/hicolor/1024x1024/apps/bankai.png"

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
