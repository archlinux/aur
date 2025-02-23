# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.60
pkgrel=1
pkgdesc='A Linux daemon to automatically update the system timezone based on location.'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('geoclue')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0473c3bbede318d2f22cf0e4017dc864b990fde04f53ab70e1fc34dd1f983d564b28b6270c58317bd832c84567b9e2325652d15c92c07ac66986790513701499')

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
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
