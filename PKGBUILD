# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=garden-tools
pkgver=2.6.0
pkgrel=1
pkgdesc="Garden grows and cultivates collections of Git trees"
arch=('x86_64')
url="https://gitlab.com/garden-rs/garden"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
source=("https://gitlab.com/garden-rs/garden/-/archive/v${pkgver}/garden-v${pkgver}.tar.gz")
sha256sums=('a53ea16f53552d86c3295adfd4ced3bc0ee9523d2483873e6724b41b1c27d80b')

prepare() {
  cd "garden-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "garden-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release

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
