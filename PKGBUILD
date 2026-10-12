# Maintainer: Braulio Oliveira <brauliobo@gmail.com>
pkgname=tantivy-cli
pkgver=0.25.0
pkgrel=1
pkgdesc='Command line interface for Tantivy, a full-text search engine library'
arch=('x86_64')
url='https://github.com/quickwit-oss/tantivy-cli'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('rust')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1f398e80d214ff53b35db3e35b7de0d6a75c9366df7c5fdce66df2e6eb0c0964')

_env() {
  export CARGO_HOME="$srcdir/cargo-home" RUSTUP_TOOLCHAIN=stable CARGO_BUILD_JOBS=4
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build"
}

prepare() {
  _env
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _env
  cd "$pkgname-$pkgver"
  nice cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tantivy "$pkgdir/usr/bin/tantivy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
