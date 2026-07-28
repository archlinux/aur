# Maintainer: nycex <bernhard / ithnet.com>

pkgname=timescaledb-toolkit
pkgver=1.24.0
pkgrel=1
pkgdesc="PostgreSQL extension for TimescaleDB analytics"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-toolkit"
license=('custom:Timescale')
depends=('gcc-libs' 'postgresql>15' 'timescaledb')
makedepends=('rust' 'clang' 'llvm')
options=(!lto)
# last commit to license - used to pin license version
_license_commit='490e9405874d284735e27e3f9f63a2f6dd31a08f'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "LICENSE-TIMESCALE-$_license_commit::https://raw.githubusercontent.com/timescale/timescaledb/$_license_commit/tsl/LICENSE-TIMESCALE"
)
sha512sums=('160da77a91f8b635f02ef7a8705cea57a7a7c7f06c5e09fb28976738de2b9aa8b43563afaf1f5fb73f63fd0cbfb08b05a0a16886ef89df25839e05eea4f4b99e'
            'b7c5ce0ef87c1c5c2d4688910a915874be742732a023319e855a8fbb666b0da42683b714e1c3368975431796e4fcd0e524fae80a999bb8f15e4406d97b14a15e')
b2sums=('a50f6d57e32b00e42560c14b3c76d2b6fc9de8537386a5ba13f3adb0a393d9a83e3013c0ed05e564a5e4e4c4982fb9a3c5ae785e624007e0b65262cf057d4bd6'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  # since Arch only ships one version of PostgreSQL ... obtain the major version
  local _PGMAJOR=$(pg_config --version | sed -e 's/PostgreSQL //' -e 's/\..*//')

  local PGRX_VERSION='=0.18.0'
  cargo install \
    --version "$PGRX_VERSION" \
    --force \
    cargo-pgrx

  # initialise pgx
  cargo pgrx init --pg$_PGMAJOR pg_config

  # build extension
  cd extension
  # cargo pgrx install --release
  cargo pgrx package

  # post-install script
  # cargo run --manifest-path ../tools/post-install/Cargo.toml -- pg_config
  cd ..
  cargo run \
    --manifest-path tools/post-install/Cargo.toml -- \
    --dir "target/release/timescaledb_toolkit-pg$_PGMAJOR"
}

package() {
  cd "$pkgname-$pkgver"

  # since Arch only ships one version of PostgreSQL ... obtain the major version
  local _PGMAJOR=$(pg_config --version | sed -e 's/PostgreSQL //' -e 's/\..*//')

  # extension
  cp -rv "target/release/timescaledb_toolkit-pg$_PGMAJOR/." "$pkgdir"

  # licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" NOTICE LICENSE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_license_commit" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"
}
