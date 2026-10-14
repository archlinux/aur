# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=cpyref
pkgver=0.1.0
pkgrel=1
pkgdesc='Copy exact bytes once and paste them by a short reference, for AI agents'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/cpyref'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('b4ac6ff1215513c665e72f21af7ef4af38cbdd219b17eb2b60b985d8d199be4d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | awk '/^host:/ {print $2}')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-targets
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/cpyref "$pkgdir/usr/bin/cpyref"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}
