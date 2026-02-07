# Maintainer: ZeNx98 <zenx98x@gmail.com>
pkgname=firedoc
pkgver=3.1.0
pkgrel=1
pkgdesc="FireDoc: Minimalist PDF Viewer"
arch=('x86_64')
url="https://github.com/ZeNx98/FireDoc"
license=('Apache')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator' 'librsvg')
makedepends=('nodejs' 'npm' 'rust' 'cargo')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "FireDoc"
  npm install
}

build() {
  cd "FireDoc"
  # tauri build handles asset bundling and cargo release build
  # Note: ensure tauri-cli is available, or use npx
  npx tauri build --bundles none
}

package() {
  cd "FireDoc"
  
  # Install binary
  install -Dm755 "src-tauri/target/release/firedoc" "$pkgdir/usr/bin/firedoc"
  
  # Install Icon
  install -Dm644 "web/icon.png" "$pkgdir/usr/share/pixmaps/firedoc.png"
  
  # Create Desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/firedoc.desktop"
[Desktop Entry]
Name=FireDoc
Comment=Minimalist PDF Viewer
Exec=firedoc %u
Icon=firedoc
Terminal=false
Type=Application
Categories=Office;Viewer;
MimeType=application/pdf;
EOF
}
