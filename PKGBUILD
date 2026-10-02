# Maintainer: mikilimj <milosz@medportal.pl>
# pkgver is bumped automatically by .github/workflows/build.yml on each
# GitHub release; checksums are refreshed there with updpkgsums.
pkgname=snippit
pkgver=1.2.2
pkgrel=1
pkgdesc="Desktop clip-trimming tool with live multi-track audio mixing and lossless export (Tauri + React)"
arch=('x86_64')
url="https://github.com/mikilimj/Snippit"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'rclone'
         'gst-plugins-good' 'gst-libav' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm')
# rusqlite's bundled sqlite3 is compiled by gcc; -flto bitcode objects can't
# be consumed by the Rust lld link step, so LTO must stay off.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "snippit.desktop")
sha256sums=('83f4b3d27bbeb32cc292a88627a60023f4247e37be0d91c6f85551c45b1961a1'
            '9a05c74e25b18ccdcdc1dc89cb0471a73203780fccea90a061d4b771c95f97a0')

prepare() {
  cd "Snippit-$pkgver"

  # Sidecar binaries are gitignored upstream (CI downloads them); on Arch the
  # app resolves sidecars next to /usr/bin/snippit, so the system ffmpeg and
  # rclone packages satisfy them. tauri-build only needs files present here.
  mkdir -p src-tauri/binaries
  ln -sf /usr/bin/ffmpeg  src-tauri/binaries/ffmpeg-x86_64-unknown-linux-gnu
  ln -sf /usr/bin/ffprobe src-tauri/binaries/ffprobe-x86_64-unknown-linux-gnu
  ln -sf /usr/bin/rclone  src-tauri/binaries/rclone-x86_64-unknown-linux-gnu

  npm ci
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu" \
    --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "Snippit-$pkgver"
  npm run tauri build -- --no-bundle
}

package() {
  cd "Snippit-$pkgver"

  install -Dm755 src-tauri/target/release/snippit "$pkgdir/usr/bin/snippit"
  install -Dm644 "$srcdir/snippit.desktop" \
    "$pkgdir/usr/share/applications/snippit.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/snippit.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/snippit.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/snippit.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/snippit.png"
}
