# Maintainer: A-007481D
pkgname=ytaudiobar-git
pkgver=r1.0000000
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

pkgver() {
  cd "$srcdir/ytaudiobar"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/ytaudiobar"
  npm install
}

build() {
  cd "$srcdir/ytaudiobar"
  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/ytaudiobar"

  install -Dm755 "src-tauri/target/release/ytaudiobar" "$pkgdir/usr/bin/ytaudiobar"

  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ytaudiobar.png"

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
StartupWMClass=ytaudiobar
EOF
}
