# Maintainer: nycex <bernhard / ithnet.com>

pkgname=timescaledb-toolkit
pkgver=1.22.0
pkgrel=1
pkgdesc="PostgreSQL extension for TimescaleDB analytics"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-toolkit"
license=('custom:Timescale')
depends=('gcc-libs' 'postgresql>14' 'timescaledb')
makedepends=('rust' 'clang' 'llvm')
options=(!lto)
# last commit to license - used to pin license version
_license_commit='490e9405874d284735e27e3f9f63a2f6dd31a08f'
# use git version (for pgrx 0.18.0) to fix the build for now
_archive_version='b888ca2e9aebc91e45e6bf22f840e0ebb6dd0ca7'
source=(
  "$pkgname-$_archive_version.tar.gz::$url/archive/$_archive_version.tar.gz"
  "LICENSE-TIMESCALE-$_license_commit::https://raw.githubusercontent.com/timescale/timescaledb/$_license_commit/tsl/LICENSE-TIMESCALE"
)
sha512sums=('3fdfbc4704eef8d9dfd8651f859d9bf7ef43801151972870cca9cd505b786579e7e45c73d530c08c6bef6402444fe7ad7461f2ecd18ed0a586e39d74513fa2ba'
            'b7c5ce0ef87c1c5c2d4688910a915874be742732a023319e855a8fbb666b0da42683b714e1c3368975431796e4fcd0e524fae80a999bb8f15e4406d97b14a15e')
b2sums=('c8cc9ff6b4c8fc96ce99bcd3bba383049d9127f37f0823546f333278c1f8273955e1399bb9cb71cc8df70ac51f5ad8f7373b59de53b2f6e38628eb709ed044ff'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0')

prepare() {
  cd "$pkgname-$_archive_version"

  # since Arch only ships one version of PostgreSQL ... obtain the major version
  export _PGMAJOR=$(pg_config --version | sed -e 's/PostgreSQL //' -e 's/\..*//')

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$_archive_version"


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
  cd "$pkgname-$_archive_version"

  # extension
  cp -rv "target/release/timescaledb_toolkit-pg$_PGMAJOR/." "$pkgdir"

  # licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" NOTICE LICENSE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_license_commit" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"
}
