# Maintainer: graysky <therealgraysky AT proton DOT me>
pkgname=zmk-studio
pkgver=0.3.1
pkgrel=4
pkgdesc="A tool for runtime keymap updates on ZMK-powered devices without reflashing firmware"
arch=(x86_64)
url="https://github.com/zmkfirmware/zmk-studio"
license=(MIT)
conflicts=($pkgname-bin)
depends=(webkit2gtk-4.1 libappindicator-gtk3 librsvg openssl)
makedepends=(npm cargo pkgconf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'ZMK Studio.desktop')
sha256sums=('e324178d762b758573b917ee380f47e58dbaf87bfc597c2415e85ecac57d2697'
            'a3c1735eda3d8184b1c2914aaf9be81eb228de4c6ebe203ddc6179822b2e57a1')

prepare() {
  cd "$pkgname-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"

  npm ci
  npm run build
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "src-tauri/target/release/app" "$pkgdir/usr/bin/zmk-studio"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 "$srcdir/ZMK Studio.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm755 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm755 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
}
