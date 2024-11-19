# Maintainer: Benjamin Gallois <benjamin at gallois dot cc>

pkgname=duniter
pkgver=0.8.1
pkgruntime="gdev-803"
pkgrel=1
pkgdesc='Crypto-currency software (based on Substrate framework) to operate Ğ1 libre currency'
arch=(any)
url='https://duniter.org/'
license=(AGPL3)
groups=()
install=duniter.install

depends=(
  'clang'
  'curl'
)

makedepends=(
  'rustup'
  'cargo'
  'git'
  'make'
  'protobuf'
)

backup=(
  'etc/$pkgname/env_file'
)

source=(
  ${pkgname}-${pkgver}.tar.gz::https://git.duniter.org/nodes/rust/duniter-v2s/-/archive/gdev-803/duniter-v2s-gdev-803.tar.gz
)

sha256sums=('4499459b390f2e548f06b80666714121c2796f4d2c5dbb776f0f21234e8ce353')

build() {
  cd ${pkgname}-v2s-${pkgruntime}
  cargo build --release
}

package() {
  cd ${pkgname}-v2s-${pkgruntime}

  install -D target/release/duniter "$pkgdir"/usr/bin/duniter2

  install -D -m 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  install -D -m 700 resources/debian/env_file $pkgdir/etc/$pkgname/env_file

  install -D -m 644 resources/debian/distance-oracle.service \
    $pkgdir/usr/lib/systemd/system/distance-oracle.service
  install -D -m 644 resources/debian/duniter-mirror.service \
    $pkgdir/usr/lib/systemd/system/duniter-mirror.service
  install -D -m 644 resources/debian/duniter-smith.service \
    $pkgdir/usr/lib/systemd/system/duniter-smith.service
}
