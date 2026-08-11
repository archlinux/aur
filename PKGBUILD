# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=garden-tools
pkgver=2.6.2
pkgrel=1
pkgdesc="Garden grows and cultivates collections of Git trees"
arch=('x86_64')
url="https://gitlab.com/garden-rs/garden"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
source=("https://gitlab.com/garden-rs/garden/-/archive/v${pkgver}/garden-v${pkgver}.tar.gz")
sha256sums=('7c2215d6cf6bd6797aac4ad0a0145e2407f939fa2258248d67ba055b778dae03')

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
