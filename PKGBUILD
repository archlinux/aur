# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rathole
pkgver=0.5.0
pkgrel=2
pkgdesc="A reverse proxy for NAT traversal"
arch=('x86_64')
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=(
  'libgcc'
  'openssl'
)
makedepends=('cargo' 'libgit2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c8698dc507c4c2f7e0032be24cac42dd6656ac1c52269875d17957001aa2de41')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  # time 0.3.29 fails to build with rustc >=1.80 (E0282, fixed upstream in
  # time-rs/time#693); bump the transitive dep since upstream hasn't cut a
  # new rathole release with an updated Cargo.lock yet.
  cargo update -p time --precise 0.3.36
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  # The TLS integration tests ship a pre-generated self-signed cert
  # (examples/tls/rootCA.crt, identity.pfx) that expires a year after
  # release; regenerate it so `cargo test` doesn't hang retrying a
  # handshake against an expired certificate.
  (cd examples/tls && sh create_self_signed_cert.sh)
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
