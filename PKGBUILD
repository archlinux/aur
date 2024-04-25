# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=parui
pkgver=1.0.17
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
sha512sums=('66c52d13e73451c61235de6d94c9e9a7a532b2745af77e5e2569e1629fd0aa6195144339507ee81b056e53d0d3d1167e7ac75b42461edd1c6b758ce34d5affc0')
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
