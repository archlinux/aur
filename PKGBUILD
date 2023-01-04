# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=networkd-broker
pkgver=0.7.0
pkgrel=1
pkgdesc="An event broker daemon for systemd-networkd"
arch=('x86_64')
url="https://github.com/bpetlert/networkd-broker"
license=('GPL-3.0-or-later')
depends=('dbus')
makedepends=(cargo)
options=(!lto)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f342fa156a5232639a093254e4863be7d502a4f755a3f90c56cfa61a61175b7b')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/networkd-broker" "$pkgdir/usr/bin/networkd-broker"

  install -Dm644 "networkd-broker.service" "$pkgdir/usr/lib/systemd/system/networkd-broker.service"

  install -dm755 "$pkgdir/etc/networkd/broker.d/"{carrier.d,degraded.d,dormant.d,no-carrier.d,off.d,routable.d}

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
