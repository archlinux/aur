# Maintainer: mikilimj <milosz@medportal.pl>
# pkgver is bumped automatically by .github/workflows/build.yml on each
# GitHub release; checksums are refreshed there with updpkgsums.
pkgname=clipsnip
pkgver=1.2.1
pkgrel=1
pkgdesc="Desktop clip-trimming tool with live multi-track audio mixing and lossless export (Tauri + React)"
arch=('x86_64')
url="https://github.com/mikilimj/ClipSnip"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'rclone'
         'gst-plugins-good' 'gst-libav' 'hicolor-icon-theme')
makedepends=('cargo' 'nodejs' 'npm')
# rusqlite's bundled sqlite3 is compiled by gcc; -flto bitcode objects can't
# be consumed by the Rust lld link step, so LTO must stay off.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "clipsnip.desktop")
sha256sums=('ad242f0a138a09cda231593c986c13bf9c8201a2386d3449179de7ce7becd5a5'
            '02189bfc35a0e6e518638e9db5b75fe98aa9f22f24bfade04957bc8a14408c88')

prepare() {
  cd "ClipSnip-$pkgver"

  # Sidecar binaries are gitignored upstream (CI downloads them); on Arch the
  # app resolves sidecars next to /usr/bin/clipsnip, so the system ffmpeg and
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
  cd "ClipSnip-$pkgver"
  npm run tauri build -- --no-bundle
}

package() {
  cd "ClipSnip-$pkgver"

  install -Dm755 src-tauri/target/release/clipsnip "$pkgdir/usr/bin/clipsnip"
  install -Dm644 "$srcdir/clipsnip.desktop" \
    "$pkgdir/usr/share/applications/clipsnip.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/clipsnip.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/clipsnip.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/clipsnip.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/clipsnip.png"
}
