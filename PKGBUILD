# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-toolkit
pkgver=1.3.1
pkgrel=1
pkgdesc="PostgreSQL extension for TimescaleDB analytics"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-toolkit"
license=('custom:Timescale')
depends=('gcc-libs' 'postgresql<14' 'timescaledb')
makedepends=('rust' 'clang' 'llvm')
# last commit to license - used to pin license version
_license_commit='490e9405874d284735e27e3f9f63a2f6dd31a08f'
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "LICENSE-TIMESCALE-$_license_commit::https://raw.githubusercontent.com/timescale/timescaledb/$_license_commit/tsl/LICENSE-TIMESCALE"
)
sha512sums=('c397b393562663caa46a97c98de2e331cc1b6f1c9628d9ba3e21f4859090fbe54bb7f38193720425390610ed0fcb851e6fa608a954eb0d8fdbbf922dfed031ce'
            'b7c5ce0ef87c1c5c2d4688910a915874be742732a023319e855a8fbb666b0da42683b714e1c3368975431796e4fcd0e524fae80a999bb8f15e4406d97b14a15e')
b2sums=('6465d534e7bcd2b11d306a65e29f0aabf361f766d8bd716a10e2d6ee24541d102d262626eadc2651e4dbae2c568e1f3c18099eeaecf0e0d7590071da9d7a93f6'
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

  # upstream uses their own fork of the pgx library (ref: README.md)
  # so this is probably the cleanest method of building
  local PGX_REPO='https://github.com/JLockerman/pgx.git'
  local PGX_BRANCH='timescale2'
  local PGX_COMMIT='e5b383422200bc0345eba2747cc50e5878d8d19c'
  cargo install \
    --git "$PGX_REPO" \
    --branch "$PGX_BRANCH" \
    --rev  "$PGX_COMMIT" \
    cargo-pgx

  # initialise pgx
  cargo pgx init --pg13 pg_config

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
