# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=networkd-broker
pkgver=1.3.0
pkgrel=1
pkgdesc="An event broker daemon for systemd-networkd"
arch=('x86_64')
url="https://github.com/bpetlert/networkd-broker"
license=('GPL-3.0-or-later')
depends=('dbus')
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('6d74fd5ab14a1f2093c295ea0b324508b710b810b4c545fbb827af3d6c031465904ab99ee908d7a19afee08455847deaa0393c86eb290fb5eb9226b7b0dd65c7')

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
