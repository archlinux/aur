# Maintainer: VisorCraft LLC <packages@visorcraft.com>

pkgname=kanoprii
pkgver=1.17.5
pkgrel=1
_pdfiumver=7947
pkgdesc='High-performance PDF editor'
arch=('x86_64')
url='https://github.com/visorcraft/Kanoprii'
license=('GPL-3.0-only' 'BSD-3-Clause' 'MIT')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=('cargo' 'npm' 'pkgconf')
conflicts=('kanoprii-bin' 'kanoprii-git')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "pdfium-linux-x64-$_pdfiumver.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium/$_pdfiumver/pdfium-linux-x64.tgz"
  'kanoprii.desktop'
)
noextract=("pdfium-linux-x64-$_pdfiumver.tgz")
sha256sums=(
  'e52a7d79fc902f30321d9c7199620ba4ae316b220a185163f1d5ea13a5ece858'
  'f73d69d309fe1f33cc7269dcc99be31ec44e1cf608e31d7e2fcc6545fc2f9323'
  '05dfa58465ff1838d64a870f5b7d4b8e456607fe8157ad9b60aeae65b56a860f'
)

prepare() {
  cd "Kanoprii-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export npm_config_cache="$srcdir/npm-cache"

  npm ci
  cargo fetch --manifest-path src-tauri/Cargo.toml --locked \
    --target "$CARCH-unknown-linux-gnu"

  install -d src-tauri/vendor/pdfium
  bsdtar -xf "$srcdir/pdfium-linux-x64-$_pdfiumver.tgz" \
    -C src-tauri/vendor/pdfium --strip-components 1 lib/libpdfium.so
  install -d "$srcdir/pdfium-licenses"
  bsdtar -xf "$srcdir/pdfium-linux-x64-$_pdfiumver.tgz" \
    -C "$srcdir/pdfium-licenses" LICENSE licenses
}

build() {
  cd "Kanoprii-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_NET_OFFLINE=true
  export CARGO_PROFILE_RELEASE_LTO=false
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_offline=true

  npx --offline tauri build --no-bundle
}

check() {
  cd "Kanoprii-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_NET_OFFLINE=true
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_offline=true

  npm run lint
  cargo test --manifest-path src-tauri/Cargo.toml --all-targets --frozen
}

package() {
  cd "Kanoprii-$pkgver"

  install -Dm755 src-tauri/target/release/kanoprii \
    "$pkgdir/usr/bin/kanoprii"
  install -Dm755 src-tauri/vendor/pdfium/libpdfium.so \
    "$pkgdir/usr/lib/Kanoprii/vendor/pdfium/libpdfium.so"
  install -Dm644 "$srcdir/kanoprii.desktop" \
    "$pkgdir/usr/share/applications/kanoprii.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/kanoprii.png"
  install -Dm644 src-tauri/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/kanoprii.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/kanoprii.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/kanoprii.png"
  install -Dm644 src-tauri/icons/512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/kanoprii.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/pdfium-licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/PDFium-Binaries-LICENSE"
  cp -a "$srcdir/pdfium-licenses/licenses/." \
    "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CREDITS.md "$pkgdir/usr/share/doc/$pkgname/CREDITS.md"
}
