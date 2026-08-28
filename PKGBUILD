# Maintainer: Swadhin Biswas <swadhin.biswas@example.com>
# Contributor: Arch Linux users
# AUR Package for Linuxy - One-click Linux Application Manager

pkgname=linuxy
pkgver=2.0.4
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
sha256sums=('b104032a099141d53dd68e492889ce7e219cb670e7113aed095b0b313893db60')

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
    if [ -f "$icon" ]; then
      install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/linuxy.png"
    fi
  done
  if [ -f "src-tauri/icons/icon.png" ]; then
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/linuxy.png"
  fi

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
