# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=1.1.2
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('35e4414adf0a9f0b1d113539a18ebfd9ada3f7fbfa0c813e96f0a19b0ad15f5de0948ec43c18c905ea3a15b97f12d18cfa0981f18ab1f9cd4f9a2eddbe64c16d')

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
    install -vDm755 -t "${pkgdir}/usr/bin" target/release/pacman-mirrorup
    install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" pacman-mirrorup.service
    install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" pacman-mirrorup.timer
    install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.adoc
}
