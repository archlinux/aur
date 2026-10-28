# Maintainer: agony <27015 at riseup dot net>

pkgname=rsql
pkgver=0.21.0
pkgrel=1
pkgdesc='Command line SQL interface for relational databases and common data file formats'
arch=('x86_64' 'aarch64')
url='https://github.com/theseus-rs/rsql'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl' 'xz')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5e89676f8c172f7e3782232fade71eaeaa3a4f8b823be764b04236579751582')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Link the system OpenSSL instead of the copy the SQL Server driver vendors
  export OPENSSL_NO_VENDOR=1
  cargo build --frozen --profile dist -p rsql_cli
}

check() {
  cd "${pkgname}-${pkgver}"
  local data="${PWD}/datasets" url
  for url in "sqlite://${data}/users.sqlite3" "rusqlite://${data}/users.sqlite3" \
    "duckdb://${data}/users.duckdb" "csv://${data}/users.csv" "parquet://${data}/users.parquet"; do
    HOME="${srcdir}/home" target/dist/rsql --url "${url}" --format csv -- 'SELECT * FROM users'
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/dist/rsql -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
