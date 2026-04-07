# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm
pkgver=1.1.2
pkgrel=1
pkgdesc="Smart desktop video silence remover and clip editor built with Tauri and FFmpeg"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm' 'patchelf' 'rust')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm-bin')
source=("cliprithm-1.1.2.tar.gz::https://github.com/BOTOOM/Cliprithm/archive/refs/tags/cliprithm-v1.1.2.tar.gz")
sha256sums=('b5755f8d53c801210e7b52159af1cacb5a6025682bb59fdfc91f46533b0b1b42')
options=('!lto')

prepare() {
  cd "Cliprithm-cliprithm-v1.1.2"
  export CARGO_HOME="$srcdir/cargo-home"
  export npm_config_cache="$srcdir/npm-cache"
  npm ci --cache "$npm_config_cache" --prefer-offline
}

build() {
  cd "Cliprithm-cliprithm-v1.1.2"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  npm run tauri build -- --no-bundle --ci --no-sign
}

package() {
  cd "Cliprithm-cliprithm-v1.1.2"

  install -Dm755 "$srcdir/target/release/cliprithm" "$pkgdir/usr/bin/cliprithm"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cliprithm.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cat > "$srcdir/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cliprithm
Comment=Smart video silence remover and clip editor
Exec=cliprithm
Icon=cliprithm
Categories=AudioVideo;AudioVideoEditing;Video;
Terminal=false
StartupWMClass=cliprithm
EOF

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
