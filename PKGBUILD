# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=dataflare-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="Easily manage your Table, view Data, write SQL and run Query."
arch=(x86_64 aarch64)
url="https://dataflare.app/"
license=('private')
options=('!strip')
depends=()
provides=(dataflare)
conflicts=(dataflare)
source_x86_64=("Dataflare-x86_64.AppImage::https://assets.dataflare.app/release/linux/x86_64/Dataflare-3.2.2.AppImage")
source_aarch64=("Dataflare-aarch64.AppImage::https://assets.dataflare.app/release/linux/aarch64/Dataflare-3.2.2.AppImage")
sha256sums_x86_64=('5327bc2b50d947c3dd99b93bbca3a213fe385af824db296e3a57c8098c9f2888')
sha256sums_aarch64=('82f7fee7717ff553d2e3e9ddbc37abca0034fdb7ebf36fdc99c9350ae2819097')

package() {
	install -Dm755 *.AppImage "$pkgdir/opt/dataflare/dataflare.appimage"

	install -dm755 "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/dataflare" << 'EOF'
#!/bin/bash
export APPIMAGE_EXTRACT_AND_RUN=1
exec /opt/dataflare/dataflare.appimage "$@"
EOF
	chmod +x "$pkgdir/usr/bin/dataflare"

	chmod +x *.AppImage
	./*.AppImage --appimage-extract >/dev/null 2>&1

	if [ -f squashfs-root/*.desktop ]; then
		install -dm755 "$pkgdir/usr/share/applications"
		desktop_file=$(find squashfs-root -name "*.desktop" -type f | head -1)
		sed 's|Exec=.*|Exec=dataflare %U|g' "$desktop_file" > "$pkgdir/usr/share/applications/dataflare.desktop"
	fi

	png_file=$(find squashfs-root -name "*.png" -type f | head -1)
	if [ -n "$png_file" ]; then
		install -Dm644 "$png_file" "$pkgdir/usr/share/pixmaps/dataflare.png"
	fi

	rm -rf squashfs-root
}
