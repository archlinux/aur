# Maintainer: Martin Pugh <martin at parity dot io>
pkgname=polkadot
pkgdesc="Rust implementation of a polkadot node"
pkgver=0.9.10
# Use _patch & bump pkgrel if we do a patch release (i.e., v0.8.28-1). Otherwise delete.

pkgrel=1
arch=('x86_64')
url="https://github.com/paritytech/${pkgname}"
license=('GPL3')
makedepends=('cargo' 'clang' 'pkgconf' 'make' 'cmake')
source=("${pkgname}-${pkgver}${_patch:+-${_patch}}.tar.gz::${url}/archive/v${pkgver}${_patch:+-${_patch}}.tar.gz" "polkadot-sysusers.conf")
sha256sums=("67308574bb640b2d2ce0c4a980012dd94352e84e459abedf502a6df673661494" "2abbd4466263b3d8ec507c24c199054cf00cc3f6292d78519876d6280674699d")

prepare() {
  rustup install stable
# TODO: grab nightly version from releases page
  rustup install nightly
  rustup target add wasm32-unknown-unknown
  rustup target add wasm32-unknown-unknown --toolchain nightly
}

build() {
  cd "$pkgname-${pkgver}${_patch:+-${_patch}}"
  cargo build --locked --release
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}${_patch:+-${_patch}}/target/release/polkadot" "${pkgdir}/usr/bin/polkadot"
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}${_patch:+-${_patch}}/scripts/packaging/polkadot.service" "${pkgdir}/usr/lib/systemd/system/polkadot.service"
  install -D -m 0644 "${srcdir}/polkadot-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/polkadot.conf"
  mkdir -p "${pkgdir}/home/polkadot" && chown polkadot:polkadot "${pkgdir}/home/polkadot"
}
