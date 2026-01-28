# Maintainer: Osman Dulundu <osman@dulundu.dev>
pkgname=pomodoro-tauri
pkgver=0.1.0
pkgrel=1
pkgdesc="A professional Pomodoro Timer built with Tauri and React, optimized for Arch Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/ravidulundu/pomodoro"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'libayatana-appindicator' 'sqlite')
makedepends=('rust' 'npm' 'cargo' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fee15b1b7ac1747ab8d7b6ff1205d289c37f736e141b2d50a11ac1505d119ca8')

build() {
  cd "pomodoro-$pkgver"
  npm install
  npm run tauri build -- --no-bundle
}

package() {
  cd "pomodoro-$pkgver"
  install -Dm755 "src-tauri/target/release/pomodoro" "$pkgdir/usr/bin/pomodoro-tauri"

  # Ses dosyaları ve tray icon'ları (/usr/share/pomodoro-tauri/)
  install -d "$pkgdir/usr/share/pomodoro-tauri"
  install -Dm644 public/sounds/*.ogg -t "$pkgdir/usr/share/pomodoro-tauri/"
  for icon in work.png short-break.png long-break.png; do
    install -Dm644 "src-tauri/icons/$icon" "$pkgdir/usr/share/pomodoro-tauri/$icon"
  done

  # Uygulama ikonları (XDG hicolor tema - tüm boyutlar)
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "public/icons/${size}x${size}/kde-pomodoro.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/pomodoro-tauri.png"
  done
  install -Dm644 "public/icons/kde-pomodoro.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pomodoro-tauri.svg"

  # Desktop Entry
  install -Dm644 "data/pomodoro-tauri.desktop" \
    "$pkgdir/usr/share/applications/pomodoro-tauri.desktop"
}
