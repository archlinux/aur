# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.75
pkgrel=1
pkgdesc='A Linux daemon to automatically update the system timezone based on location.'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('geoclue')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('e02cf63920eb0de4e67b9d37c67e7e4522fea1f300079b948b1fd6cdfdd5f466c41de8b7b558fa024a2e327fd616fc4f5e97b0c6cb6d08fa1fbc66eb8e015726')

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
