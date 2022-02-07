# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname='rustypaste-cli'
pkgdesc="A CLI tool for rustypaste."
pkgver=0.1.3
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/rustypaste-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bfd5064783ca770cbbf5c07958709a37fbe5903c5c2f0dd89e170031ac4437ea')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
  cd "${pkgname}-${pkgver}"
  CFLAGS+=' -ffat-lto-objects'
  env CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

check(){
  cd "${pkgname}-${pkgver}"
  env CARGO_INCREMENTAL=0 cargo test --locked --offline
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m755 "target/release/rpaste" "$pkgdir/usr/bin/rpaste"
  install -D -m644 "config.toml" "$pkgdir/usr/share/doc/rustypaste-cli/example/config.toml"
}

# vim:set ts=2 sw=2 et:
