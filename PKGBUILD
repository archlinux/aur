# Maintainer: Alessandro Pezzato <alessandro@pezzato.net>

pkgname=provola
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool for quick development/test cycle in any language'
arch=(x86_64)
url='https://github.com/alepez/provola'
license=(APACHE MIT)
makedepends=(cargo clang cmake git rust libxcb)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f78a4fccd25b7723cc8900b1bf2de44003853f47cb0c5eae53caf8d23fecd337')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch \
    --locked \
    --target="$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="--remap-path-prefix=$(pwd)="
  export CARGO_TARGET_DIR=target
  cargo build \
    --release \
    --frozen \
    --all-features
  ./target/release/provola --shell-compl bash > provola.bash
  ./target/release/provola --shell-compl fish > provola.fish
  ./target/release/provola --shell-compl zsh > provola.zsh
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  # Executable
  install -Dm755 target/release/$pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # Licenses
  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

  # Shell completions
  install -Dm644 provola.bash \
    "$pkgdir/usr/share/bash-completion/completions/provola"
  install -Dm644 provola.fish \
    "$pkgdir/usr/share/fish/completions/provola.fish"
  install -Dm644 provola.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_provola"
}
