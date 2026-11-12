# Maintainer: agony <27015 at riseup dot net>

pkgname=helix-db
pkgver=3.7.0
pkgrel=1
pkgdesc='CLI for an OLTP graph database with vector and full-text search'
arch=('x86_64' 'aarch64')
url='https://github.com/HelixDB/helix-db'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('docker: run local instances'
            'npm: TypeScript queries and agent skill installs'
            'podman: run local instances')
options=('!lto')
install=helix-db.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1417b224a5db2ff61e9aecf7d970077ca436aa6ea68c2fe3f6e2340eaa597f53')

_helix_env() {
  export HELIX_HOME="${srcdir}/helix-home"
  export DO_NOT_TRACK=1
  export HELIX_NO_UPDATE_CHECK=1
}

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p helix-cli --bin helix
}

check() {
  cd "${pkgname}-${pkgver}"
  _helix_env
  local _helix="${PWD}/target/release/helix"
  [[ "$("${_helix}" --version)" == "Helix CLI ${pkgver}" ]]
  rm -rf "${srcdir}/check"
  mkdir -p "${srcdir}/check/demo"
  cd "${srcdir}/check/demo"
  "${_helix}" init local --no-skills < /dev/null 2>&1 | grep -q 'Initialized demo'
  "${_helix}" add local --name test < /dev/null 2>&1 | grep -q 'Added test'
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/helix "${pkgdir}/usr/bin/helix-db"
}
