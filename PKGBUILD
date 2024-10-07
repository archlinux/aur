# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=scu
pkgver=1.4.0
pkgrel=3
pkgdesc="System fetch utility is aimed at informativeness"
arch=(i686 x86_64)
url="https://gitlab.com/omnid/$pkgname"
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
)
makedepends=(rust)
options=(!debug !lto)
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('180b4d27815e89de67d8b354e32c7e7ed91e0ecc8ce5608bb7297d776522b186303a60711ae87f394c7a9d7d4d9ee0d93bd744a282e8996b26e649df9cd38c8b')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/.cargo
  sed -i 's|git = "https://github.com/omnitix/libscu", version = "1.3.6"|version = "=1.3.6"|' Cargo.toml
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
}
