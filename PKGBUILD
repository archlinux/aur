# Maintainer: envolution
# Contributor: James Williams <jowilliams12000 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=wallust
pkgver=3.3.0
pkgrel=2
pkgdesc="generate colors from an image"
arch=('x86_64' 'i686')
url="https://codeberg.org/explosion-mental/wallust"
license=('MIT')
makedepends=('cargo')
optdepends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
options=('!lto')
sha256sums=('9e0a3f0e2eff6b7ddf8011b15602550f15a4c4fb3037947e71adf578e6486522')

prepare() {
  cd "$pkgname"-"$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"-"$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --features themes,doc --frozen --release
}

package() {
  cd "$pkgname"-"$pkgver"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/wallust
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/wallust.1 man/wallust-theme.1 man/wallust-cs.1 man/wallust-run.1
  install -Dm644 -t "${pkgdir}/usr/share/man/man5" man/wallust.5
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wallust/LICENSE"
}
# vim:set ts=2 sw=2 et:
