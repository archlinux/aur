# Maintainer: cargabsj175 <cargabsj175 at gmail.com>
# PKGBUILD for Arch Linux - T-NESx Retro Emulator

pkgname=t-nesx
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform retro game emulator (NES, SNES, GBA & Intellivision)"
arch=('x86_64')
url="https://gitlab.com/cargabsj175/t-nesx"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'gdk-pixbuf2' 'libsoup3' 'libappindicator-gtk3')
makedepends=('npm' 'rust' 'cargo-c')
source=(git+https://gitlab.com/cargabsj175/t-nesx.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"

	# Install frontend dependencies
	npm install --legacy-peer-deps

	# Build frontend
	npm run build

	# Build Tauri (Rust backend)
	cd src-tauri
	cargo build --release
	cd ..
}

package() {
	cd "$srcdir/$pkgname"

	# Create directories
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/lib/$pkgname"
	install -d "$pkgdir/usr/share/applications"
	install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"

	# Install binary
	install -m 755 "src-tauri/target/release/t-nesx" "$pkgdir/usr/bin/$pkgname"

	# Install frontend assets
	cp -r dist/* "$pkgdir/usr/lib/$pkgname/"

	# Desktop entry
	cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Type=Application
Name=T-NESx
Comment=Cross-platform retro game emulator
Exec=/usr/bin/$pkgname
Icon=$pkgname
Categories=Game;Emulator;
Terminal=false
EOF

	# SVG icon
	install -m 644 public/t-nesx.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
