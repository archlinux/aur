# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm
pkgver=1.1.0
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
source=("cliprithm-1.1.0.tar.gz::https://github.com/BOTOOM/Cliprithm/archive/refs/tags/cliprithm-v1.1.0.tar.gz")
sha256sums=('6b43c049ae1b4dd345d77ee809487de0dece2d37c2c6f4b566e470887cf0722a')
options=('!lto')

prepare() {
  cd "Cliprithm-cliprithm-v1.1.0"
  export CARGO_HOME="$srcdir/cargo-home"
  export npm_config_cache="$srcdir/npm-cache"
  npm ci --cache "$npm_config_cache" --prefer-offline
}

build() {
  cd "Cliprithm-cliprithm-v1.1.0"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  npm run build
  cargo build --manifest-path src-tauri/Cargo.toml --release --locked
}

package() {
  cd "Cliprithm-cliprithm-v1.1.0"

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
