# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-chef
pkgver=0.1.78
pkgrel=1
pkgdesc='A cargo-subcommand to speed up Rust Docker builds using Docker layer caching'
arch=('aarch64' 'x86_64')
url="https://github.com/LukeMathWalker/$pkgname"
license=(APACHE MIT)
depends=(glibc libgcc cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('fe37d150bfb02e6be0816710d7f52d3d9fa832169f77b11537e0ff3af03ad380e39648cc8fc6d051c6450b1277410ba13c0aa79fda2476c10c0bfe3ac8f9e4ac')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target="$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
