# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-toolkit
pkgver=1.16.0
pkgrel=2
pkgdesc="PostgreSQL extension for TimescaleDB analytics"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-toolkit"
license=('custom:Timescale')
depends=('gcc-libs' 'postgresql>14' 'timescaledb')
makedepends=('rust' 'clang' 'llvm')
# last commit to license - used to pin license version
_license_commit='490e9405874d284735e27e3f9f63a2f6dd31a08f'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "LICENSE-TIMESCALE-$_license_commit::https://raw.githubusercontent.com/timescale/timescaledb/$_license_commit/tsl/LICENSE-TIMESCALE"
)
sha512sums=('b8e63f4f85655b23220cb09716ec88383a42d27e05e1a136abb6c9a4d93ad9b5f2c4c0514a6aa338452b79bc52514056529409cb78f3f7f3f3ad8ea2a86ed3c3'
            'b7c5ce0ef87c1c5c2d4688910a915874be742732a023319e855a8fbb666b0da42683b714e1c3368975431796e4fcd0e524fae80a999bb8f15e4406d97b14a15e')
b2sums=('ce466bf15488216331fb9b992792bbae52330d89b5a5763b2e9bf2787bcd7d9bbab0b0ff01fe33cdbea639a4466888df95ddfe156e5b6e2e9d568cbdcd01fe74'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0')

prepare() {
  cd "$pkgname-$pkgver"

  # since Arch only ships one version of PostgreSQL ... obtain the major version
  export _PGMAJOR=$(pg_config --version | sed -e 's/PostgreSQL //' -e 's/\..*//')

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"


  local PGX_VERSION='0.7.1'
  cargo install \
    --version "$PGX_VERSION" \
    --force \
    cargo-pgx

  # initialise pgx
  cargo pgx init --pg14 pg_config

  # build extension
  cd extension
  cargo pgx package

  # post-install script
  cd ..
  cargo run \
    --manifest-path tools/post-install/Cargo.toml -- \
    --dir "target/release/timescaledb_toolkit-pg$_PGMAJOR"
}

package() {
  cd "$pkgname-$pkgver"

  # extension
  cp -rv "target/release/timescaledb_toolkit-pg$_PGMAJOR/." "$pkgdir"

  # licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" NOTICE LICENSE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_license_commit" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"
}
