# Maintainer: Huseyn Teymurzade <huseynteymurrr74@gmail.com>
pkgname=pokeductor
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal Pokedex and evolution analyzer with sprite rendering, built with Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/pokeductor"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('743f5d09b75e44569687b0157fd3d6acd803f5eb7eb7d5177eb9d639a710cd6a')

prepare() {
  cd "$pkgname-$pkgver"
  # Fetch the crate dependencies here so build() and check() stay offline.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
