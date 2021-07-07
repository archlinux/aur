# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale_extension
pkgver=0.2.0
pkgrel=2
pkgdesc="PostgreSQL extension for Promscale"
arch=('x86_64')
url="https://github.com/timescale/promscale_extension"
license=('Apache' 'custom:Timescale')
depends=('postgresql')
makedepends=('rust' 'clang' 'llvm')
_tslver=2.3.1 # latest version of Timescale - used to pin license version
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "LICENSE-TIMESCALE-$_tslver::https://raw.githubusercontent.com/timescale/timescaledb/$_tslver/tsl/LICENSE-TIMESCALE")
b2sums=('be01d7835ba13efd104fed3c9380d928580d05763d4e482bb404cba1086de21ce65d01be50af8223d313a153632095fbe0636055e9c3c72ae72c2fe6e94f61d9'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0')

prepare() {
  mkdir cargo
}

build() {
  cd "$pkgname-$pkgver"

  # set environment variable to avoid polluting $HOME
  export CARGO_HOME="$srcdir/cargo"

  # upstream uses their own fork of the pgx library (ref: README.md)
  # additionally, a different branch/commit is present in Cargo.lock
  # so this is probably the cleanest method of building
  local PGX_REPO='https://github.com/JLockerman/pgx.git'
  local PGX_BRANCH='timescale'
  local PGX_COMMIT='87e0460e6e88d6ffa9b9eb37dce4b71e4336e31e'
  cargo install \
    --git "$PGX_REPO" \
    --branch "$PGX_BRANCH" \
    --rev  "$PGX_COMMIT" \
    cargo-pgx

  # path to pg_config is provided to avoid downloading postgresql libs
  cargo pgx init --pg13=/usr/bin/pg_config

  # now we can compile
  make

  # unset environment variable
  unset CARGO_HOME
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_tslver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"
}
