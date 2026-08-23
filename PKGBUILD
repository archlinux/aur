# Maintainer: Swadhin Biswas <swadhin.biswas@example.com>
# Contributor: Arch Linux users
# AUR Package for Linuxy - One-click Linux Application Manager

pkgname=linuxy
pkgver=2.0.3
pkgrel=1
pkgdesc="Multi-platform Desktop Application Manager with Firejail sandboxing"
arch=('x86_64' 'aarch64')
url="https://github.com/swadhinbiswas/linuxy"
license=('MIT')
depends=('firejail' 'xdg-utils' 'webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'xdo')
makedepends=('cargo' 'nodejs' 'npm' 'llvm' 'clang' 'patchelf')
optdepends=('appimageupdatetool: AppImage auto-updates')
install=linuxy.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/swadhinbiswas/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4c3f43c717be45c66aa6790904be7d3130b0444051680e05343cee3f5e44546')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm run build
  cd src-tauri
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --locked --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "src-tauri/target/release/linuxy" "$pkgdir/usr/bin/linuxy"

  install -Dm644 "src-tauri/debian/desktop-template.desktop" "$pkgdir/usr/share/applications/linuxy.desktop"

  for size in 32 128 256 512; do
    icon="src-tauri/icons/${size}x${size}.png"
    [ -f "$icon" ] && install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/linuxy.png"
  done
  [ -f "src-tauri/icons/icon.png" ] && install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/linuxy.png"
  [ -f "src-tauri/icons/icon.icns" ] && install -Dm644 "src-tauri/icons/icon.icns" "$pkgdir/usr/share/icons/hicolor/512x512/apps/linuxy.icns"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
