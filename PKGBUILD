# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-semver-checks
pkgver=0.19.0
pkgrel=1
pkgdesc='Scan your Rust crate for semver violations'
url='https://github.com/obi1kenobi/cargo-semver-checks'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('libgit2' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/obi1kenobi/cargo-semver-checks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a962dfad0474bb5e419953543d08f319eb07a916bb6581e65d8de32b4d7aa31')
b2sums=('6f5b45538e7c73132d3669db5a084efa05b28cb1d6007bb651a0a2a591589a67ca8b6909d673a23b2c9fae45cd16248f96cf4fa1dddaa2bbf6fc81a31ceddea7')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-semver-checks

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
