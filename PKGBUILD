# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=networkd-broker
pkgver=0.4.1
pkgrel=1
pkgdesc="An event broker daemon for systemd-networkd"
arch=('x86_64')
url="https://github.com/bpetlert/networkd-broker"
license=('GPL3')
depends=('systemd')
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2456471b06e542ac28837b6f44e0f03ae20bfdb59fbd5282974ac746d77e8828')

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
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
