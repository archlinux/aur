# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.82
pkgrel=1
pkgdesc='A Linux daemon to automatically update the system timezone based on location.'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('geoclue')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('09bc5a1a6854e6f1542fc67b0b2e074c24a95663e6b853e9e920cb8fdc59a7ace59553e32f1d913eca203a88d1cc058f670be2e639b79f7aa03af3988e6719b3')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
