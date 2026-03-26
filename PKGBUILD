# Maintainer: huza(elza) <https://github.com/khuza08>
pkgname=rustify
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern YouTube music player built with Tauri and Rust"
arch=('x86_64')
url="https://github.com/khuza08/rustify"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'libnm' 'librsvg' 'sqlite' 'yt-dlp' 'ffmpeg')
makedepends=('nodejs' 'npm' 'rust' 'cargo' 'pkgconf')
provides=('rustify')
conflicts=('rustify-git')
source=("rustify-$pkgver.tar.gz::https://github.com/khuza08/rustify/archive/v$pkgver.tar.gz"
        "rustify.desktop")
sha256sums=('c4d672046e79a8d4f2e7e6d23c234ee70b599e5cfc1ca6e4fa07079d69d4c585'
            '419d082c7952f458874793432d3703fdb57a5366dd4ae80c5276f5ea7ab4a765')

prepare() {
  # Check for unmanaged files that might conflict
  if [ -f "/usr/bin/rustify" ] || [ -f "/usr/share/applications/rustify.desktop" ]; then
    echo ":: Found existing manual rustify files in /usr/bin or /usr/share/applications."
    read -p ":: Do you want to remove them now? (requires sudo) [y/N] " _cleanup
    if [[ "$_cleanup" =~ ^[Yy]$ ]]; then
      sudo rm -f "/usr/bin/rustify" "/usr/share/applications/rustify.desktop"
      sudo rm -f /usr/share/icons/hicolor/*/apps/rustify.png
    fi
  fi

  cd "$srcdir/rustify-$pkgver"
  # Remove externalBin from tauri.conf.json — AUR uses system yt-dlp/ffmpeg/deno
  sed -i '/"externalBin"/,/\]/d' src-tauri/tauri.conf.json
  # Use system SQLite instead of bundled
  sed -i 's/rusqlite = { version = "0.31", features = \["bundled"\] }/rusqlite = { version = "0.31" }/' src-tauri/Cargo.toml
}

build() {
  cd "$srcdir/rustify-$pkgver"
  npm ci
  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/rustify-$pkgver"
  
  # Install the main binary
  install -Dm755 "src-tauri/target/release/rustify" "$pkgdir/usr/bin/rustify"
  
  # Install the desktop entry
  install -Dm644 "$srcdir/rustify.desktop" "$pkgdir/usr/share/applications/rustify.desktop"
  
  # Install icons
  local icon_sizes=(32x32 64x64 128x128)
  for size in "${icon_sizes[@]}"; do
    install -Dm644 "src-tauri/icons/${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/rustify.png"
  done
  install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/rustify.png"
}
