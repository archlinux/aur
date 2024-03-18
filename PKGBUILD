# Maintainer: Gustav Sörnäs <gustav@sornas.net>

pkgname=swim-git
pkgver=0.6.0.r7.g89004a3
pkgrel=1
pkgdesc="Build tool for the Spade programming language"
arch=('x86_64')
url="https://gitlab.com/spade-lang/swim.git"
license=('custom')
conflicts=('swim')
provides=('swim')
depends=('git' 'cargo')
optdepends=('fujprog: upload to devices supported by fujprog'
            'icestorm-nightly: pack and upload to iCE40-devices'
            'nextpnr-ice40-nightly: pnr for iCE40-devices'
            'nextpnr-ecp5-nightly: pnr for ECP5-devices'
            'openocd: upload to devices supported by openocd'
            'prjtrellis-nightly: utilities for ECP5-devices'
            'tinyprog: upload to devices supported by tinyprog'
            'yosys-nightly: synthesising using the yosys suite')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo build --locked --release --target-dir=target
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" SWIM_DOWNLOAD_SPADE=1 cargo test --locked --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm 755 target/release/swim -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
