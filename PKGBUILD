# Maintainer: Huseyn Teymurzade <huseynteymurrr74@gmail.com>
pkgname=pokeductor
pkgver=0.6.0
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
sha256sums=('479ac8e28b324e370538c6378ee8b17a9093c4ff2c0115ebfe916b46d3067eae')

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
  # Since 0.6.0 the binary generates its own completions and man page from its
  # flag definitions, so they always match the build being packaged.
  mkdir -p target/extras
  local bin="target/release/$pkgname"
  "$bin" --completions bash > target/extras/$pkgname.bash
  "$bin" --completions zsh  > target/extras/_$pkgname
  "$bin" --completions fish > target/extras/$pkgname.fish
  "$bin" --man              > target/extras/$pkgname.1
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
  install -Dm644 "target/extras/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "target/extras/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "target/extras/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "target/extras/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
