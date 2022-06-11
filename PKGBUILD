# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rathole
pkgver=0.4.2
pkgrel=1
pkgdesc="A reverse proxy for NAT traversal"
arch=('x86_64')
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'libgit2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7110b0f62fff68de37c21970ba26a5c46e9b9af9df84f135789a0e3a9215756f')

prepare() {
  cd "$pkgname-$pkgver"
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
  for svc in "${pkgname}@.service" "${pkgname}c@.service" "${pkgname}s@.service"; do
    install -Dm 644 "examples/systemd/$svc" -t "$pkgdir/usr/lib/systemd/system/"
  done
}

# vim:set ts=2 sw=2 et:
