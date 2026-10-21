# Maintainer: Nimesh Poudel <nimeshpoudel89@gmail.com>
pkgname=csleep
pkgver=1.0.0
pkgrel=1
pkgdesc='Chunked sleep with a smooth progress bar and remaining-time countdown'
arch=('x86_64')
url='https://github.com/CowGivesMilk/csleep'
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/V1.tar.gz")
sha256sums=('9f4a04d7a1041a49dc4c688a1c5d49f5d6b2a6432584eade48fb5982efe4b9ac')

prepare() {
  cd "$srcdir"/$pkgname-*/
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir"/$pkgname-*/
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir"/$pkgname-*/
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir"/$pkgname-*/
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
