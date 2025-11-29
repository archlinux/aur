# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=wireguard-gui-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="A wireguard client GUI for Linux made with nextauri."
arch=(x86_64)
url="https://github.com/0xle0ne/wireguard-gui"
license=('MIT')
options=('!strip')
depends=()
provides=(wireguard-gui-bin)
conflicts=(wireguard-gui)
source_x86_64=("wireguard-gui-${pkgver}.AppImage::https://github.com/0xle0ne/wireguard-gui/releases/download/${pkgver}-stable/wireguard-gui_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('6db3f1712eb3d35945da6a9a00da5aa23851dd7471d8d1b8b655a3bd20118eed')

package() {
	install -Dm755 *.AppImage "$pkgdir/opt/wireguard-gui/wireguard-gui.appimage"
	install -dm755 "$pkgdir/usr/bin"

	cat >"$pkgdir/usr/bin/wireguard-gui" <<'EOF'
#!/bin/bash
export APPIMAGE_EXTRACT_AND_RUN=1
exec /opt/wireguard-gui/wireguard-gui.appimage "$@"
EOF

	chmod +x "$pkgdir/usr/bin/wireguard-gui"
	chmod +x *.AppImage

	./*.AppImage --appimage-extract >/dev/null 2>&1

	if [ -f squashfs-root/*.desktop ]; then
		install -dm755 "$pkgdir/usr/share/applications"
		desktop_file=$(find squashfs-root -name "*.desktop" -type f | head -1)
		sed 's|Exec=.*|Exec=wireguard-gui %U|g' "$desktop_file" >"$pkgdir/usr/share/applications/wireguard-gui.desktop"
	fi

	png_file=$(find squashfs-root -name "*.png" -type f | head -1)
	if [ -n "$png_file" ]; then
		install -Dm644 "$png_file" "$pkgdir/usr/share/pixmaps/wireguard-gui.png"
	fi

	rm -rf squashfs-root
}
