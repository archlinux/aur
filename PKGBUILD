# Maintainer: Gustav Sörnäs <gustav@sornas.net>
pkgname=swim
pkgver=0.7.0
pkgrel=1
pkgdesc="Build tool for the Spade programming language"
arch=('x86_64')
url="https://gitlab.com/spade-lang/swim"
license=('EUPL-1.2')
depends=('git' 'cargo' 'openssl')
optdepends=('fujprog: upload to devices supported by fujprog'
            'icestorm-nightly: pack and upload to iCE40-devices'
            'nextpnr-ice40-nightly: pnr for iCE40-devices'
            'nextpnr-ecp5-nightly: pnr for ECP5-devices'
            'openocd: upload to devices supported by openocd'
            'prjtrellis-nightly: utilities for ECP5-devices'
            'tinyprog: upload to devices supported by tinyprog'
            'yosys-nightly: synthesising using the yosys suite')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo build --locked --release --target-dir=target
}

check() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" SWIM_DOWNLOAD_SPADE=1 cargo test --locked --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"

    install -Dm 755 target/release/swim -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
