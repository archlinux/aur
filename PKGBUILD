# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=rye
pkgver=0.1.1
_pkgname="$pkgname"
_pkg="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="An experimental alternative to poetry, pip, pipenv, venv, virtualenv, pdm, hatch, …"
arch=(any)
url="https://github.com/mitsuhiko/rye"
license=(MIT)
depends=(
  zlib
  openssl
  glibc
  gcc-libs
  libxcrypt-compat # https://github.com/mitsuhiko/rye/issues/15
)
makedepends=(cargo)
provides=(rye)
conflicts=(rye)
source=("$_pkg.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2951176225cbd8921880d34641cf94598658a835b90db813923c0bf58319f93f')

prepare() {
  cd "$_pkg/"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkg/"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkg/"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkg/"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

