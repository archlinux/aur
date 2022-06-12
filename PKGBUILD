# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale_extension
pkgver=0.5.0
pkgrel=1
pkgdesc='PostgreSQL extension for Promscale'
arch=('x86_64')
url='https://github.com/timescale/promscale_extension'
license=('custom:Timescale')
depends=(
  'gcc-libs'
  'timescaledb'
  'promscale'
)
makedepends=(
  'git'
  'rust'
  'clang'
  'llvm'
)
options=('!lto')
# last commit to license - used to pin license version
_license_commit='490e9405874d284735e27e3f9f63a2f6dd31a08f'
_commit='25dfdb60b92a305cfd7ad5769f3734ee378c8add'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  "LICENSE-TIMESCALE-$_license_commit::https://raw.githubusercontent.com/timescale/timescaledb/$_license_commit/tsl/LICENSE-TIMESCALE"
)
sha512sums=('SKIP'
            'b7c5ce0ef87c1c5c2d4688910a915874be742732a023319e855a8fbb666b0da42683b714e1c3368975431796e4fcd0e524fae80a999bb8f15e4406d97b14a15e')
b2sums=('SKIP'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  # this is *very* annoying
  cargo install cargo-pgx \
    --git https://github.com/timescale/pgx \
    --branch promscale-staging \
    --rev ee52db6bbaa006f6f3674bddeff8516c3b914e71
}

build() {
  cd "$pkgname"

  export PATH="$HOME/.cargo/bin:$PATH"

  # initialise pgx
  export _PGMAJOR=$(pg_config --version | sed -e 's/PostgreSQL //' -e 's/\..*//')
  cargo pgx init "--pg${_PGMAJOR}" pg_config

  # build extension
  make
}

package() {
  cd "$pkgname"

  export PATH="$HOME/.cargo/bin:$PATH"

  # extension
  make DESTDIR="$pkgdir" install

  # licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE NOTICE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_license_commit" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"
}
