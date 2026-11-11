# Maintainer: adelmonte
pkgname=solitaire-rs
pkgver=0.2.1
pkgrel=1
pkgdesc="Windows 95 style Klondike solitaire for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/adelmonte/solitaire-rs"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43d038ce0237379d40d88ce6fede7257e712910bc0903236ab08f30a20bebe66')

_host() {
  rustc -vV | sed -n 's/^host: //p'
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(_host)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --target "$(_host)"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --target "$(_host)"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/$(_host)/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "data/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "data/icons/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
