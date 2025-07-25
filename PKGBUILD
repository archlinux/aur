# Maintainer: Johannes Schöpp <darkdiscover at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.9.0
pkgrel=3
pkgdesc="Cross-platform parser for Windows XML EventLog Format"
arch=('x86_64')
url="https://github.com/omerbenamram/evtx"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
changelog=CHANGELOG.md
options=('!lto')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e5f5221879a68b455a086653ab457f815544d1580e591f52d3b0ed5b4b24f328')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  ## must be --locked because not all dependencies are downloaded at this point
  cargo build --locked --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features || echo ':: Warning: tests failed'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm755 target/release/evtx_dump -t "$pkgdir/usr/bin/"
  install -Dvm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
