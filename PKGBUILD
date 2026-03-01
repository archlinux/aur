# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>
# Owner: srtnnm <a641557-at-gmail-dot-com>

pkgname=scu
pkgver=2.1.0
pkgrel=1
pkgdesc="System fetch utility is aimed at informativeness"
arch=(x86_64)
url="https://github.com/srtnnm/$pkgname"
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
)
makedepends=(rust)
options=(!debug !lto)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('66103ad029a6fd9489b7275abd949eb192e21586c5dc8f0638344941af85fae68be93688187ee1f4d05d54f8b759dcc590cf509bfb31930b8afea393dd09ab93')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/.cargo
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
