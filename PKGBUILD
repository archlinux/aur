# Maintainer: hase9awa <hase9awa@users.noreply.github.com>

pkgname=termtypist
pkgver=0.1.4
pkgrel=1
pkgdesc='Keyboard-first terminal typing trainer inspired by Monkeytype'
arch=('x86_64')
url='https://github.com/hase9awa/termtypist'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'sqlite')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('377f7a8adc2f08112a68928b356cb2e3ce08f578388eb66dbe0d44db2126e30c')

_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export SQLITE3_LIB_DIR=/usr/lib
  export SQLITE3_INCLUDE_DIR=/usr/include
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _cargo_env
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  sed -i 's/^rusqlite = { version = "0\.32", features = \["bundled"\] }$/rusqlite = "0.32"/' Cargo.toml
  cargo update --offline -p rusqlite --precise 0.32.1
}

build() {
  cd "${pkgname}-${pkgver}"
  _cargo_env
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  _cargo_env
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
