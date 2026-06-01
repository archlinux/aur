# Maintainer: A-007481D
pkgname=ytaudiobar-git
pkgver=2.2.2
pkgrel=1
pkgdesc="A sleek YouTube audio player built with Tauri and React"
arch=('x86_64')
url="https://github.com/ilyassan/ytaudiobar"
license=('MIT')
depends=('webkit2gtk-4.1' 'openssl' 'libappindicator-gtk3' 'librsvg' 'ffmpeg')
makedepends=('git' 'nodejs' 'npm' 'rust' 'cargo')
provides=('ytaudiobar')
conflicts=('ytaudiobar')
source=("git+https://github.com/ilyassan/ytaudiobar.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/ytaudiobar"
  npm install
}

build() {
  cd "$srcdir/ytaudiobar"
  # Build the tauri app (only the binary, we'll package it manually)
  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/ytaudiobar"
  
  # Install binary
  install -Dm755 "src-tauri/target/release/ytaudiobar" "$pkgdir/usr/bin/ytaudiobar"
  
  # Install icon
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ytaudiobar.png"
  
  # Install .desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/ytaudiobar.desktop" <<EOF
[Desktop Entry]
Name=YTAudioBar
Comment=YouTube Audio Player
Exec=ytaudiobar
Icon=ytaudiobar
Terminal=false
Type=Application
Categories=Audio;Music;Player;
EOF
}
