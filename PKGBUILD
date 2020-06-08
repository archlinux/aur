# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=networkd-broker
pkgver=0.3.1
pkgrel=1
pkgdesc="An event broker daemon for systemd-networkd"
arch=('x86_64')
url="https://github.com/bpetlert/networkd-broker"
license=('GPL3')
depends=('systemd' 'iw')
makedepends=('rust' 'cargo')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('122304e1dcf75933efa4b9cb4cb0d1eaef74b529b32424a1e05ee05302852631')

build() {
  cd "${pkgname}-${pkgver}"

  # Ignore target-dir in ~/.cargo/config, reset it to default: "target".
  cargo build --release --locked --target-dir target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/networkd-broker" "$pkgdir/usr/bin/networkd-broker"

  install -Dm644 "networkd-broker.service" "$pkgdir/usr/lib/systemd/system/networkd-broker.service"

  install -dm755 "$pkgdir/etc/networkd/broker.d/"{carrier.d,configured.d,configuring.d,degraded.d,dormant.d,linger.d,no-carrier.d,off.d,routable.d,unmanaged.d}

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
