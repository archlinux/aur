# Maintainer: firtoz <aur@firtoz.com>
# Upstream: https://github.com/webadderall/Recordly
# Template: update-aur.ts overwrites pkgver and the # AppImage / # Upstream MIT lines in sha256sums.

pkgname=recordly-bin
pkgver=1.1.3
pkgrel=2
pkgdesc="Open-source screen recorder and editor with auto-zoom, cursor effects, and polished video export"
arch=(x86_64)
url="https://github.com/webadderall/Recordly"
license=(MIT)
depends=(fuse2)
source=(
	"https://github.com/webadderall/Recordly/releases/download/v${pkgver}/Recordly-linux-x64.AppImage"
	"recordly.desktop"
	"LICENSE::https://raw.githubusercontent.com/webadderall/Recordly/v${pkgver}/LICENSE.md"
)
sha256sums=(
	'c899b1658d4d79f1507c7ae776b3825bc7c770c89a8adfc4e38d38d2df1dcae4' # AppImage v${pkgver}
	'bf499305b338b29beaf6423a7a046e867a3c8bf7262e8d8fecc736fe452e6e66' # recordly.desktop
	'5adc380b244d735b5c2509b435f0b726fbbd781e0e3d795ef27be42e83b21d69' # Upstream MIT LICENSE
)
options=(!strip)

package() {
	install -d "$pkgdir/opt/recordly"
	install -Dm755 "$srcdir/Recordly-linux-x64.AppImage" "$pkgdir/opt/recordly/Recordly.AppImage"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/recordly" << 'EOF'
#!/bin/sh
exec /opt/recordly/Recordly.AppImage "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/recordly"

	install -Dm644 "$srcdir/recordly.desktop" "$pkgdir/usr/share/applications/dev.recordly.app.desktop"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir"
	chmod +x Recordly-linux-x64.AppImage
	./Recordly-linux-x64.AppImage --appimage-extract
	for size in 16 24 32 48 64 128 256 512 1024; do
		src="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/recordly.png"
		if [ -f "$src" ]; then
			install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dev.recordly.app.png"
		fi
	done
	rm -rf squashfs-root
}
