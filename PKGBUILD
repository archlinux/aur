# Maintainer: Arti Zirk <aur@arti.ee>

pkgname=obby
pkgver=0.4.2
pkgrel=1
pkgdesc="Modern IRC client for the web, desktop and mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/obbyworld/obby"
license=('GPL-3.0-only')
depends=(
  'cairo'
  'desktop-file-utils'  # deep-link plugin runs update-desktop-database
  'gdk-pixbuf2'
  'glib-networking'  # GIO TLS modules, needed for HTTPS in the webview
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'  # system tray, loaded at runtime
  'openssl'
  'webkit2gtk-4.1'
  'xdg-utils'  # deep-link plugin runs xdg-mime
)
makedepends=('cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "obby.desktop")
sha256sums=('2e828701c23284a18560433310c8c156ee49950a4e6bbe74c069d6a30e095c10'
            '96887c77dd578aa0a03d239d2a1ca11ace174f5cd7113154a76cd05cde4f5279')
# makepkg's lto option leaks -flto into the C/asm objects that the ring
# crate builds through cc; lld then cannot resolve ring_core_* symbols.
# Rust's own LTO is controlled by the cargo profile and is unaffected.
options=(!debug !lto)

prepare() {
  cd "$pkgname-$pkgver"

  # Keep npm's cache inside $srcdir instead of littering the user's home.
  npm ci --cache "$srcdir/npm-cache" --no-audit --no-fund

  # Fetch crates up front so build() runs offline against Cargo.lock.
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml \
    --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  # The frontend is built by Tauri's beforeBuildCommand (npm run build).
  # Bundling is left out: this package installs the binary, desktop entry
  # and icons itself. Arguments after the second -- go to cargo.
  npm run tauri build -- --no-bundle -- --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src-tauri/target/release/Obby "$pkgdir/usr/bin/obby"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/obby.desktop" "$pkgdir/usr/share/applications/obby.desktop"

  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/obby.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/obby.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/obby.png"
}
