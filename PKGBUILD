# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=garden-tools
pkgver=2.1.0
pkgrel=1
pkgdesc="Garden grows and cultivates collections of Git trees"
arch=('x86_64')
url="https://gitlab.com/garden-rs/garden"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://gitlab.com/garden-rs/garden/-/archive/v${pkgver}/garden-v${pkgver}.tar.gz")
sha256sums=('e7f386a13286b68331e925c1cd73a58bce0eb78bbace7ee4b11ffb1ca62635ef')

prepare() {
  cd "garden-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "garden-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features

  # completions
  target/release/garden completion bash > garden.bash
  target/release/garden completion fish > garden.fish
  target/release/garden completion zsh > _garden
}

package() {
  cd "garden-v${pkgver}"
  install -Dm755 "target/release/garden" -t "$pkgdir/usr/bin/"

  # install completions
  install -Dm644 garden.bash \
    "$pkgdir/usr/share/bash-completion/completions/garden"
  install -Dm644 garden.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 _garden -t \
    "$pkgdir/usr/share/zsh/site-functions/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
