# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=parui
pkgver=1.0.16
pkgrel=1
pkgdesc="Simple TUI frontend for paru or yay"
arch=('x86_64')
url="https://github.com/Vonr/parui"
license=('MIT')
depends=('git' 'pacman' 'gcc-libs')
makedepends=('cargo')
optdepends=('paru: default AUR interface'
            'yay: alternative AUR interface')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a2c794b40dc82e60db4de83d8e013e6ed471801bd9c70f0cd58c3d5ae73fd01479f68ae28b90fc6ab75d06e52ab275c63bff6cbddcb59c0f6dec9ba1f5f3d9ed')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
