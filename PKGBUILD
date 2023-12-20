# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cargo-hakari
pkgver=0.9.14
pkgrel=2
pkgdesc="Manage workspace-hack packages to speed up builds in large workspaces"
arch=('x86_64')
url="https://github.com/facebookincubator/cargo-guppy"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('83fd807c65554fa2ad17ebea05286bb97951c370bdf1301ae993e6c6d48930e24ba0ce392940caa14782d4a464126a57afadcd9ddfaf8a2917c95e8c81e6941c')

prepare() {
  mv "cargo-guppy-$pkgname-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver/tools/$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver/tools/$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver/tools/$pkgname"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
