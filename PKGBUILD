# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.45
pkgrel=1
pkgdesc='A Linux daemon to automatically update the system timezone based on location.'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('geoclue')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('49c311e6006df9361750931735e841446fd5732439b50e279cae1250488cfb866146f7802433957388f506818954d1b889edd09bdac2357de26a41d327ef0287')

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
