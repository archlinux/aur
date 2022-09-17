# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rathole
pkgver=0.4.4
pkgrel=1
pkgdesc="A reverse proxy for NAT traversal"
arch=('x86_64')
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'libgit2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('42b72a85c01ff53b329c864e0fb9bc94103bfe27554987ad6efe0c2e3adc801d')

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
