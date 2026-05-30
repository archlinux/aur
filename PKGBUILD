# Maintainer: Fanyi Pu <pufanyi@gmail.com>
pkgname=waybar-google-calendar
pkgver=0.0.1
pkgrel=2
pkgdesc='GTK4/Relm4 Google Calendar popup for Waybar'
arch=('x86_64')
url='https://github.com/pufanyi/waybar-google-calendar'
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
makedepends=('cargo')
_source_tag="v$pkgver-$pkgrel"
source=("$pkgname-${_source_tag#v}.tar.gz::$url/archive/refs/tags/$_source_tag.tar.gz")
sha256sums=('e8b3c06b895d3623d5103219bbca8641373f2518e88dbedbf5eaad44e042ca89')
options=('!lto')

prepare() {
  cd "$pkgname-${_source_tag#v}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-${_source_tag#v}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-${_source_tag#v}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-${_source_tag#v}"
  install -Dm755 "target/release/waybar-gcal" "$pkgdir/usr/bin/waybar-gcal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/waybar-clock.json "$pkgdir/usr/share/doc/$pkgname/examples/waybar-clock.json"
  install -Dm644 examples/custom-theme.css "$pkgdir/usr/share/doc/$pkgname/examples/custom-theme.css"
  install -Dm644 assets/themes/apple-light.css "$pkgdir/usr/share/$pkgname/themes/apple-light.css"
}
