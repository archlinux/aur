# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=tuistash
pkgver=0.7.1
pkgrel=1
pkgdesc='A terminal user interface for Logstash'
arch=('x86_64')
url="https://github.com/edmocosta/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f2ae6ddc4eb6d41edc65d523b96a3531c0edf2f993bbac67c27ec9cc6985cf4')
makedepends=('cargo' 'openssl' 'logstash')
depends=('gcc-libs')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo test --release --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
