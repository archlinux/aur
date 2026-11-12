# Maintainer: agony <27015 at riseup dot net>

pkgname=roughenough
pkgver=2.2.0
pkgrel=1
pkgdesc='Roughtime (RFC 10049) server and client'
arch=('x86_64' 'aarch64')
url='https://github.com/int08h/roughenough'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('720e610abdc862b05a49537030ba3333d7c287afcd7455c7963d6214fc66b357')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features \
    --bin roughenough_client --bin roughenough_server --bin roughenough_keys
}

check() {
  cd "${pkgname}-${pkgver}"
  local _bin="${PWD}/target/release" _server _rc=0
  local _pubk='3b6a27bcceb6a42d62a3a8d02a6f0d73653215771de243a63ac048a18b59da29'
  [[ "$("${_bin}/roughenough_client" --version)" == "roughenough-client ${pkgver}" ]]
  [[ "$("${_bin}/roughenough_server" --version)" == "roughenough-server ${pkgver}" ]]
  [[ "$("${_bin}/roughenough_keys" --version)" == "roughenough-keys ${pkgver}" ]]
  "${_bin}/roughenough_server" --insecure-zero-seed --interface 127.0.0.1 --port 28445 --quiet &
  _server=$!
  sleep 1
  "${_bin}/roughenough_client" -q -t 5 -k "${_pubk}" 127.0.0.1 28445 || _rc=$?
  kill "${_server}"
  wait "${_server}"
  (( _rc == 0 ))
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/roughenough_{client,server,keys} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
