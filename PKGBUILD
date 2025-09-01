# Maintainer: graysky <therealgraysky AT proton DOT me>
pkgname=zmk-studio
pkgver=0.3.1
pkgrel=2
pkgdesc="A tool for runtime keymap updates on ZMK-powered devices without reflashing firmware"
arch=(x86_64)
url="https://github.com/zmkfirmware/zmk-studio"
license=(MIT)
conflicts=($pkgname-bin)
depends=(webkit2gtk-4.1 libappindicator-gtk3 librsvg openssl)
makedepends=(npm rust pkgconf)
source=("https://github.com/zmkfirmware/zmk-studio/archive/refs/tags/v${pkgver}.tar.gz"
  'ZMK Studio.desktop')
sha256sums=('e324178d762b758573b917ee380f47e58dbaf87bfc597c2415e85ecac57d2697'
            'a3c1735eda3d8184b1c2914aaf9be81eb228de4c6ebe203ddc6179822b2e57a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  npm ci
  npm run build
  cd src-tauri
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "src-tauri/target/release/app" "$pkgdir/usr/bin/zmk-studio"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755  "$srcdir/ZMK Studio.desktop" "$pkgdir/usr/share/applications"
  install -Dm755 src-tauri/icons/128x128.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm755 src-tauri/icons/32x32.png -t "$pkgdir/usr/share/icons/hicolor/32x32/apps"
}
