# Maintainer: Ramazan Berk Şirin <ramazanberksirin at protonmail dot com>

pkgname=bettertricks
pkgver=1.0
pkgrel=1
pkgdesc="Recovery-first Wine prefix manager and Winetricks-compatible recipe engine"
arch=('x86_64')
url="https://github.com/RamazanBerk20/Bettertricks"
license=('LGPL-2.1-or-later')
depends=('webkit2gtk-4.1' 'wine' 'cabextract' '7zip' 'unzip' 'gzip' 'tar' 'xz' 'zstd')
makedepends=('rust' 'nodejs' 'pnpm' 'libayatana-appindicator' 'librsvg')
optdepends=('zenity: graphical prompts for compatibility-host recipes')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8740ae54f06b2d83ad275abcf41e884b364c222210c9970ce897f02cc6c74156')

prepare() {
  cd "Bettertricks-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  pnpm install --frozen-lockfile
}

build() {
  cd "Bettertricks-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  pnpm build:web
  cargo build --frozen --release -p bettertricks -p bettertricks-desktop
}

package() {
  cd "Bettertricks-$pkgver"

  install -Dm755 "$srcdir/cargo-target/release/bettertricks" \
    "$pkgdir/usr/bin/bettertricks"
  install -Dm755 "$srcdir/cargo-target/release/bettertricks-desktop" \
    "$pkgdir/usr/bin/bettertricks-desktop"

  install -Dm644 packaging/linux/io.bettertricks.desktop.desktop \
    "$pkgdir/usr/share/applications/io.bettertricks.desktop.desktop"
  install -Dm644 packaging/linux/io.bettertricks.desktop.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.bettertricks.desktop.metainfo.xml"

  install -Dm644 apps/desktop/src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/bettertricks-desktop.png"
  install -Dm644 apps/desktop/src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/bettertricks-desktop.png"
  install -Dm644 apps/desktop/src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/bettertricks-desktop.png"
  install -Dm644 apps/desktop/src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/bettertricks-desktop.png"

  install -d "$pkgdir/usr/share/bettertricks/catalog"
  cp -a catalog/. "$pkgdir/usr/share/bettertricks/catalog/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/doc/$pkgname/NOTICE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
