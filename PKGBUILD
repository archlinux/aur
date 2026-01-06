# Maintainer: Johannes Schöpp <darkdiscover at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=evtx
pkgver=0.11.0
pkgrel=1
pkgdesc="Cross-platform parser for Windows XML EventLog Format"
arch=('x86_64')
url="https://github.com/omerbenamram/evtx"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
changelog=CHANGELOG.md
options=('!lto')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2fe4b453693fb13def79350fcf1ef23801e82c05e0329d0cba5ababb2c9cfae5')

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
