# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=poketex
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple Pokedex based on TUI"
arch=('x86_64')
url="https://github.com/ckaznable/poketex"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-cargo-lock.patch::$url/commit/161129b77f64a927b50ce40983cc2f092ac57fa5.patch")
sha256sums=('7443ff0e7183c592446cf25c1d9ccb55d1a79a59ed016baac71a23b62f6edc0f'
            '32087253723ebcb2e5e07d951bfd7c50b81a973c5f12d5e13bc9be1e19c5eba2')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../$pkgname-$pkgver-cargo-lock.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
