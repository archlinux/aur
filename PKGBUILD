# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=cooklang-chef
pkgver=0.10.2
pkgrel=1
pkgdesc="A CLI to manage cooklang recipes"
arch=("x86_64")
url="https://github.com/Zheoni/cooklang-chef"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zheoni/$pkgname/archive/refs/tags/v$pkgver.tar.gz" "LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('c217674fc4715ce48d86373e9b9b69f4e1fe9e5f5cc7474b674b281d32646016'
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
