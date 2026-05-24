# Maintainer: firtoz <aur@firtoz.com>
# Upstream: https://github.com/webadderall/Recordly
# Template: update-aur.ts overwrites pkgver and the # AppImage / # Upstream AGPL lines in sha256sums.

pkgname=recordly-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Open-source screen recorder and editor with auto-zoom, cursor effects, and polished video export"
arch=(x86_64)
url="https://github.com/webadderall/Recordly"
license=(AGPL-3.0-or-later MIT)
depends=(fuse2)
source=(
	"Recordly-linux-x64-${pkgver}.AppImage::https://github.com/webadderall/Recordly/releases/download/v${pkgver}/Recordly-linux-x64.AppImage"
	"recordly.desktop"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/webadderall/Recordly/v${pkgver}/LICENSE.md"
)
sha256sums=(
	'8edfffd1ac54de706ce8d3dffdb99de1fd3e4ce5c8bdaabc35dc4ed5dbac67de' # AppImage v${pkgver}
	'bf499305b338b29beaf6423a7a046e867a3c8bf7262e8d8fecc736fe452e6e66' # recordly.desktop
	'cc34899e27d42f52ceecafb840b5db7af17095c256bcce73a8c7221707664ffe' # Upstream AGPL LICENSE
)
options=(!strip)

package() {
	install -d "$pkgdir/opt/recordly"
	install -Dm755 "$srcdir/Recordly-linux-x64-${pkgver}.AppImage" "$pkgdir/opt/recordly/Recordly.AppImage"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/recordly" << 'EOF'
#!/bin/sh
exec /opt/recordly/Recordly.AppImage "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/recordly"

	install -Dm644 "$srcdir/recordly.desktop" "$pkgdir/usr/share/applications/dev.recordly.app.desktop"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir"
	chmod +x "Recordly-linux-x64-${pkgver}.AppImage"
	./"Recordly-linux-x64-${pkgver}.AppImage" --appimage-extract
	for size in 16 24 32 48 64 128 256 512 1024; do
		src="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/recordly.png"
		if [ -f "$src" ]; then
			install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dev.recordly.app.png"
		fi
	done
	rm -rf squashfs-root
}
