# Maintainer: taotieren <admin@taotieren.com>

pkgname=wlink
pkgver=0.1.1
pkgrel=3
pkgdesc="wlink - WCH-Link(RV) command line tool"
arch=($CARCH)
url="https://github.com/ch32-rs/wlink"
license=('Apache-2.0' 'MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
    libusb
    systemd-libs)
makedepends=(
    cargo
    git
    rust)
backup=()
options=('!strip' '!debug')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('817adff68df1883d489cfe698ab8b05495ed666bd5cab4d2df67a5198b55a9a3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    # Tests need nightly features
    RUSTC_BOOTSTRAP=1 cargo test --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-wlink.rules" <<EOF
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8010" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="4348" ATTR{idProduct}=="55e0" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8012" MODE:="0666"
EOF
}
