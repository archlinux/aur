# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=cooklang-chef
pkgver=0.9.2
pkgrel=1
pkgdesc="A CLI to manage cooklang recipes"
arch=("x86_64")
url="https://github.com/Zheoni/cooklang-chef"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate" "LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('90819220a674f024225d5ded782f27965e13ba5e17b766bd2be71408dc30e55e'
  'e46fe296aa7c51286e420c91ee23780034495f2e9033ed40e2eb3ee4118610be')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  target/release/chef generate-completions bash >chef.bash
  target/release/chef generate-completions fish >chef.fish
  target/release/chef generate-completions zsh >chef.zsh
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$pkgname-$pkgver"
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

  install -Dm644 chef.bash "$pkgdir/usr/share/bash-completion/completions/chef"
  install -Dm644 chef.fish "$pkgdir/usr/share/fish/vendor_completions.d/chef.fish"
  install -Dm644 chef.zsh "$pkgdir/usr/share/zsh/site-functions/_chef"
}
