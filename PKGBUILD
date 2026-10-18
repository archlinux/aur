# Maintainer: Gustav Sörnäs <gustav@sornas.net>
pkgname=swim
pkgver=0.20.0
pkgrel=1
pkgdesc="Build tool for the Spade programming language"
arch=('x86_64')
url="https://codeberg.org/spade-lang/swim"
license=('EUPL-1.2')
depends=('git' 'cargo' 'openssl' 'glibc' 'libgcc' 'zstd')
# TODO: check if more tools are supported
optdepends=('fujprog: upload to devices supported by fujprog'
            'icestorm-nightly: pack and upload to iCE40-devices'
            'nextpnr-ice40-nightly: pnr for iCE40-devices'
            'nextpnr-ecp5-nightly: pnr for ECP5-devices'
            'openocd: upload to devices supported by openocd'
            'prjtrellis-nightly: utilities for ECP5-devices'
            'tinyprog: upload to devices supported by tinyprog'
            'yosys-nightly: synthesising using the yosys suite')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
export ZSTD_SYS_USE_PKG_CONFIG=1

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo build --frozen --release
}

check() {
    cd "${srcdir}/${pkgname}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" SWIM_DOWNLOAD_SPADE=1 cargo test --frozen
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm 755 target/release/swim -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
