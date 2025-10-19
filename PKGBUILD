# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.93
pkgrel=1
pkgdesc='A Linux daemon to automatically update the system timezone based on location.'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('geoclue')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('6c6d6e5e2367c8c62a38c6e01db3c1dacbc388a110bf7fdb7c88782b04b1f1b5fc3b5251dff4e610673d3d82e5c970df5d386687a8ae11530a2c38c5bb3b6a3a')

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
