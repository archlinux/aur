# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=scriptorium
pkgver=0.1.0
pkgrel=1
pkgdesc="Note-taking application"
arch=('x86_64')
url="https://github.com/athanclark/scriptorium"
license=('GPL-3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'pnpm')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80d9c6200c2875487c01a24a0dfcaf505c804cb0d89b331dcd1720c5a65b4599')  # Replace with real checksum
options=(!lto !strip)   # avoid post-build strip and LTO for safety

build() {
  cd "$srcdir/$pkgname-$pkgver"
  pnpm install --frozen-lockfile
  export NO_STRIP=1
  pnpm tauri build --bundles=appimage
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/scriptorium" \
    "$pkgdir/usr/bin/scriptorium"
  install -Dm644 "src-tauri/target/release/bundle/appimage/$pkgname.AppDir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "src-tauri/target/release/bundle/appimage/$pkgname.AppDir/$pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}
