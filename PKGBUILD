# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=networkd-broker
pkgver=1.2.0
pkgrel=1
pkgdesc="An event broker daemon for systemd-networkd"
arch=('x86_64')
url="https://github.com/bpetlert/networkd-broker"
license=('GPL-3.0-or-later')
depends=('dbus')
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('a2e0965eafe92e2fe269a6327d5c22aefda71c9d0ed7dc349d3867e7ec5e16ad278ecd82647feedf0a37ed552bb3d9495f15114c8ec28bf8f7c0b44bdf2c8296')

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
