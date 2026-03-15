# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=rtree
pkgver=0.1.1
pkgrel=1
pkgdesc="A fast tree command with smart pattern filtering and live-search TUI"
arch=('x86_64')
url="https://github.com/marcusbandit/rtree"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23b7791d6bf2e5b7dc2ab6a641f506ef3d95d910a7b3d55262ec6a1b8adc9b42')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  mkdir -p completions
  ./target/release/rtree --generate-completions bash > completions/rtree.bash
  ./target/release/rtree --generate-completions zsh  > completions/_rtree
  ./target/release/rtree --generate-completions fish > completions/rtree.fish
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname"        "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE                           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/rtree.bash            "$pkgdir/usr/share/bash-completion/completions/rtree"
  install -Dm644 completions/_rtree                "$pkgdir/usr/share/zsh/site-functions/_rtree"
  install -Dm644 completions/rtree.fish            "$pkgdir/usr/share/fish/vendor_completions.d/rtree.fish"
}
