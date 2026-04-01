# Maintainer: Swadhin Biswas <swadhin.biswas@example.com>
# AUR Package for Linuxy - One-click Linux Application Manager

pkgname=linuxy
pkgver=1.1.0
pkgrel=1
pkgdesc="One-click Linux Application Manager with Firejail sandboxing"
arch=('x86_64')
url="https://github.com/swadhinbiswas/linuxy"
license=('MIT')
depends=('firejail' 'xdg-utils' 'webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'xdo')
makedepends=('cargo' 'nodejs' 'npm')
install=linuxy.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/swadhinbiswas/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14ec94d5c68c770849b945eb793a5ff638a4ceb682d65aa69b64068dc5d30d27')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm run build
  cd src-tauri
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 "src-tauri/target/release/linuxy" "$pkgdir/usr/bin/linuxy"
  
  # Install desktop file
  install -Dm644 "src-tauri/debian/desktop-template.desktop" "$pkgdir/usr/share/applications/linuxy.desktop"
  
  # Install icons
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/linuxy.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/linuxy.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/linuxy.png"
  install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/linuxy.png"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
