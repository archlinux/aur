# Maintainer: agony <27015 at riseup dot net>

pkgname=rbitcoin
pkgver=0.9.2
pkgrel=1
pkgdesc='Bitcoin full node with a relational archive, pure-Rust consensus and Electrum'
arch=('x86_64' 'aarch64')
url='https://github.com/rbitcoin-org/rbitcoin'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0dab7e20966ca4f3994d36d8bc24d79a03cde7e37f658bc761ebeba8e6ee41db')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p rbitcoin-node -p rbitcoin-cli
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/rbitcoin-node --version 2>&1)" == "rbitcoin-node ${pkgver}" ]]
  [[ "$(target/release/rbitcoin-cli --version 2>&1)" == "rbitcoin-cli ${pkgver}" ]]
  rm -rf "${srcdir}/regtest"
  target/release/rbitcoin-node --network regtest --datadir "${srcdir}/regtest" --no-seeds --no-listen --rpc --max-run-secs 60 --log-level error &
  for _ in {1..100}; do
    [[ -S "${srcdir}/regtest/rpc.sock" ]] && break
    sleep 0.2
  done
  target/release/rbitcoin-cli --datadir "${srcdir}/regtest" --network regtest generatetoaddress 1 bcrt1qw508d6qejxtdg4y5r3zarvary0c5xw7kygt080 > /dev/null
  [[ "$(target/release/rbitcoin-cli --datadir "${srcdir}/regtest" --network regtest getblockcount)" == '1' ]]
  [[ "$(target/release/rbitcoin-cli --datadir "${srcdir}/regtest" --network regtest stop)" == 'rbitcoin stopping' ]]
  wait $!
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/rbitcoin-node target/release/rbitcoin-cli -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
