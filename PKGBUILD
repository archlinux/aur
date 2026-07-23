# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot
pkgver=1.4.2
pkgrel=1
pkgdesc='Jellyfin cast receiver that controls external MPV'
arch=('x86_64')
url='https://github.com/hewel/jellypilot'
license=('MIT')
options=('!lto')
depends=(
  'cairo'
  'dbus'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'mpv'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'cargo'
  'librsvg'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d01601758a38b8a72c668ab4bd853185bb253ccec48c9f2a7d24f7746a67eee7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  bun install --frozen-lockfile --ignore-scripts
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CARGO_NET_OFFLINE=true bun tauri build --no-bundle --ci -- --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/jellypilot" \
    "$pkgdir/usr/bin/jellypilot"
  install -Dm644 "packaging/arch/top.pigfun.jellypilot.desktop" \
    "$pkgdir/usr/share/applications/top.pigfun.jellypilot.desktop"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/top.pigfun.jellypilot.png"
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
