# Maintainer: taotieren <admin@taotieren.com>

pkgname=wlink
pkgver=0.1.2
pkgrel=1
pkgdesc="wlink - WCH-Link(RV) command line tool"
arch=($CARCH)
url="https://github.com/ch32-rs/wlink"
license=('Apache-2.0 AND MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
    libusb
    systemd-libs
)
makedepends=(
    git
    rust
)
backup=()
options=('!strip' '!debug')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('d57848740c121e4f77e7f290fe1729c586ed2c43c068760f1c226d2f12b0a76e')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    # Tests need nightly features
    RUSTC_BOOTSTRAP=1 cargo test --release
}

package() {
    cd "${srcdir}/${pkgname}/"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-wlink.rules" <<EOF
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8010" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="4348" ATTR{idProduct}=="55e0" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8012" MODE:="0666"
EOF
}
