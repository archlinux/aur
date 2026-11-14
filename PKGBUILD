# Maintainer: Rizakulov Temur <riakulovtemur0@gmail.com>
pkgname=cmdflow
pkgver=3.1.0
pkgrel=1
pkgdesc="A minimalist CLI tool written in Rust that parses shell history and renders graphs"
arch=('x86_64' 'aarch64')
url="https://github.com/voideez/cmdflow"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
install=cmdflow.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('85202cac0a604663a0d1c4974de18f165e60b66e343700d0337bea9f6b03e440')

prepare() {
  cd "$pkgname-$pkgver"
  # Define a local cargo home directory inside the build sandbox to avoid losing fetched crates
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  # Use the same local cargo home directory
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  if [ -f LICENSE.txt ]; then
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
