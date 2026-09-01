# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=garden-tools
pkgver=2.7.0
pkgrel=1
pkgdesc="Garden grows and cultivates collections of Git trees"
arch=('x86_64')
url="https://gitlab.com/garden-rs/garden"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
source=("https://gitlab.com/garden-rs/garden/-/archive/v${pkgver}/garden-v${pkgver}.tar.gz")
sha256sums=('b3a0231542b630e1a05b7c9910b260e78aea7215fb0e1195f4128fc8c4b10a77')

prepare() {
  cd "garden-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "garden-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  # completions
  for shell in bash fish zsh; do
    target/release/garden completion "${shell}" > "garden.${shell}"
  done
}

package() {
  cd "garden-v${pkgver}"
  install -Dm755 "target/release/garden" -t "$pkgdir/usr/bin/"

  # install completions
  install -Dm644 garden.bash \
    "$pkgdir/usr/share/bash-completion/completions/garden"
  install -Dm644 garden.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 garden.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_garden"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
