# Maintainer: shaweel <shaweel@proton.com>
fetchMetadataValue() {
	curl -s https://raw.githubusercontent.com/shaweel/shaweelTimer/refs/heads/stable/metadata.json \
	| grep "$1" \
	| sed "s/.*\"$1\": \"\(.*\)\".*/\1/"
}

pkgname=$(fetchMetadataValue "packageName")
pkgdesc=$(fetchMetadataValue "description")
url=$(fetchMetadataValue "url")
pkgver=$(fetchMetadataValue "version")
pkgrel=1
arch=(any)
license=("GPL-3.0-or-later")

depends=("python" "python-gobject" "gtk4" "libadwaita")

source=("$pkgname-$pkgver.tar.gz::https://github.com/shaweel/shaweelTimer/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('SKIP')

package() {
	cd "$srcdir/shaweelTimer-$pkgver"

	install -Dm755 main.py "$pkgdir/usr/lib/shaweelTimer/main.py"
	install -Dm755 status.py "$pkgdir/usr/lib/shaweelTimer/status.py"
	install -Dm755 config.py "$pkgdir/usr/lib/shaweelTimer/config.py"
	#install -Dm644 metadata.json "$pkgdir/usr/lib/shaweelTimer/metadata.json"
	install -Dm644 assets/shaweelTimer.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/shaweeltimer.png"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/shaweeltimer" << "EOF"
#!/bin/sh
export GSK_RENDERER=ngl
exec python3 /usr/lib/shaweelTimer/main.py "$@"
EOF

	install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/shaweeltimer.desktop" << "EOF"
[Desktop Entry]
Name=shaweelTimer
Exec=shaweeltimer
Icon=shaweeltimer
Type=Application
Categories=Utility;
EOF
}