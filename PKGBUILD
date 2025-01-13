# Maintainer: 71e6fd52 <71e6fd52@gmail.com>

pkgname=quicssh-rs
pkgver=0.1.5
pkgrel=2
pkgdesc='A simple ssh server based on quic protocol'
url='https://github.com/oowl/quicssh-rs'
license=('MIT')
makedepends=('cargo')
depends=(
  gcc-libs
  glibc
)
arch=('x86_64')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/oowl/$pkgname/archive/v$pkgver.tar.gz"
    'quicssh-rs.service')
b2sums=(
    'c512cdf06c557a94fa41ac334d2cf5a12af6bdf34da08152fac5a1020f18e19690b8c588f54904073928e6c79c7860fe84d38219bb8495e365f07b3df33e8a5d'
    'SKIP')
options=(!debug !lto)

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/lib/systemd/system" "quicssh-rs.service"
}
