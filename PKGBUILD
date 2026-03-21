# Maintainer: firtoz <aur@firtoz.com>
# Upstream: https://github.com/webadderall/Recordly
# Template: update-aur.ts overwrites pkgver and the # AppImage / # Upstream MIT lines in sha256sums.

pkgname=recordly-bin
pkgver=1.1.4
pkgrel=1
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
	'41de1fd0ea35f62b2d0f9c9e5a495e4a63997baace729e1fd13020c674fdec57' # AppImage v${pkgver}
	'bf499305b338b29beaf6423a7a046e867a3c8bf7262e8d8fecc736fe452e6e66' # recordly.desktop
	'efb67088bc3ecd6b070b0779c00e8a74fe55256b0eaf9ff96cb895a7eefe8de9' # Upstream MIT LICENSE
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
