# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-toolkit
pkgver=1.2.0
pkgrel=3
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
  'insert_prefix.patch.template'
)
sha512sums=('1f7472acc6fae9764e651acbcc81f5975cbd11aa44084c2d23fde16e24ab03d5fef5827239a4ed1a8f261a6031ea7e9c6b5cfabed1fa23042970ac8b147f10c8'
            'b7c5ce0ef87c1c5c2d4688910a915874be742732a023319e855a8fbb666b0da42683b714e1c3368975431796e4fcd0e524fae80a999bb8f15e4406d97b14a15e'
            '68cfe17895e222028bf70dc0dbc1b9efd1570915d262d92dad09609538dea516653c1b073a0313df120a4e4ed92b60f8cce65671174d125dbb6cba9318152a4e')
b2sums=('37da0af9c75304d0285161e1e81d335a145528b44f8b7e6402b8c882b19a5d78573cf3f93468cbaf1d67bd0209eff995f89c9f03fac49300ac816289832df7f2'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0'
        'f937ec7b936b9e2cb27e7ec95571717e35dfdd606272f02886b289a7d77ed448640ad031191c597899c692ee67faa6095aa92bb64eba5da057a6f0cb9f026eb8')

prepare() {
  cd "$pkgname-$pkgver"

  # since Arch only ships one version of PostgreSQL ... obtain the major version
  export _PGMAJOR=$(pg_config --version | sed -e 's/PostgreSQL //' -e 's/\..*//')

  # generate and apply path prefix patch for post-install script
  # the post-install script has hardcoded paths, therefore makes
  # assumptions about paths & installation methods
  # ref: https://github.com/timescale/timescaledb-toolkit/issues/236
  sed "s/@@PGMAJOR@@/$_PGMAJOR/" ../insert_prefix.patch.template > insert_prefix.patch
  patch --strip=1 --input insert_prefix.patch

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
  cargo run --manifest-path tools/post-install/Cargo.toml -- pg_config
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
