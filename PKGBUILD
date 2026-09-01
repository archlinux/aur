# Maintainer: Huseyn Teymurzade <huseynteymurrr74@gmail.com>
pkgname=pokeductor
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal Pokedex and evolution analyzer with sprite rendering, built with Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/pokeductor"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# `ring`, which arrived with the switch to rustls in 0.4.0, compiles C of its
# own. makepkg's LTO would hand those objects to the Rust linker as bitcode it
# cannot resolve, so the link fails on ring's symbols. The release profile
# already sets `lto = true`, so the Rust side loses nothing here.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f38aef357b33c2870aeacf684ec89c970a4e0a1a8e19feae83f6c8e32da5ebc4')

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
