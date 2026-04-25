# Maintainer: Carlos Sánchez <cargabsj175@gmail.com>
# Contributor: mDirecto Team

pkgname=mdirecto
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight, fast, cross-platform Markdown editor with WYSIWYG editing"
arch=(x86_64 aarch64)
url="https://gitlab.com/cargabsj175/mdirecto"
license=(GPL-3.0-only)
depends=(
	gtk3
	webkit2gtk-4.1
	libappindicator-gtk3
)
makedepends=(
	nodejs
	npm
	rust
	cargo-c
)
source=("git+https://gitlab.com/cargabsj175/mdirecto.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	# skip appimage generation bundle
	sed -i 's/"targets": "all"/"targets": ["deb"]/g' src-tauri/tauri.conf.json
	
	# Install frontend dependencies
	npm install --legacy-peer-deps

	# Build frontend
	npm run tauri build
}

package() {
	cd "$srcdir/${pkgname}"
	
	install -Dm755 "src-tauri/target/release/mdirecto" "$pkgdir/usr/bin/${pkgname}" 2>/dev/null || true
	
	install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	
	# Install frontend assets
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r dist/* "$pkgdir/usr/lib/$pkgname/"

	install -d "$pkgdir/usr/share/applications"
	cat > "$pkgdir/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=mDirecto
Comment=A lightweight Markdown editor with WYSIWYG editing
Exec=mdirecto %U
Icon=mdirecto
Terminal=false
Type=Application
Categories=Office;TextEditor;
MimeType=text/markdown;text/x-markdown;
StartupNotify=true
StartupWMClass=mDirecto
Keywords=markdown;editor;wysiwyg;
EOF
}
