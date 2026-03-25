# Maintainer: huza(elza) <https://github.com/khuza08>
pkgname=rustify-git
pkgver=r130.e96912e
pkgrel=1
pkgdesc="A modern YouTube music player built with Tauri and Rust"
arch=('x86_64')
url="https://github.com/khuza08/rustify"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'libnm' 'librsvg' 'sqlite' 'yt-dlp' 'ffmpeg')
makedepends=('git' 'nodejs' 'npm' 'rust' 'cargo' 'pkgconf')
provides=('rustify')
conflicts=('rustify')
source=('rustify::git+https://github.com/khuza08/rustify.git#branch=devel'
        'rustify.desktop')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/rustify"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/rustify"
  # Remove externalBin from tauri.conf.json — AUR uses system yt-dlp/ffmpeg/deno
  sed -i '/"externalBin"/,/\]/d' src-tauri/tauri.conf.json
  # Use system SQLite instead of bundled (bundled fails with lld on Arch)
  sed -i 's/rusqlite = { version = "0.31", features = \["bundled"\] }/rusqlite = { version = "0.31" }/' src-tauri/Cargo.toml
}

build() {
  cd "$srcdir/rustify"
  # Install frontend dependencies (use npm ci for reproducible, lockfile-based installs)
  npm ci
  # Build the Tauri application — --no-bundle produces just the binary
  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/rustify"
  
  # Install the main binary (built as rustify-app, installed as rustify)
  install -Dm755 "src-tauri/target/release/rustify-app" "$pkgdir/usr/bin/rustify"
  
  # Install the desktop entry
  install -Dm644 "$srcdir/rustify.desktop" "$pkgdir/usr/share/applications/rustify.desktop"
  
  # Install icons
  local icon_sizes=(32x32 64x64 128x128)
  for size in "${icon_sizes[@]}"; do
    install -Dm644 "src-tauri/icons/${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/rustify.png"
  done
  install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/rustify.png"
}
