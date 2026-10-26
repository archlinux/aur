# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=networkd-broker
pkgver=1.4.0
pkgrel=1
pkgdesc="An event broker daemon for systemd-networkd"
arch=('x86_64')
url="https://github.com/bpetlert/networkd-broker"
license=('GPL-3.0-or-later')
depends=('dbus')
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('461e589b951b989aadbfca4c49add78a661d00120b27c410b29003dc29d0fcfe178212867aa893c8615b32e864a59aaef9e5b6f01b854284b7125c703610de9e')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -vDm755 -t "${pkgdir}/usr/bin" target/release/networkd-broker
    install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" networkd-broker.service
    install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.adoc
    install -vdm755 "${pkgdir}/etc/networkd/broker.d/"{carrier.d,degraded.d,dormant.d,no-carrier.d,off.d,routable.d}
}
