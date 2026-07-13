# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp
pkgver=0.3.0
pkgrel=4
pkgdesc="WCH ISP Tool in Rust"
arch=($CARCH)
url="https://github.com/ch32-rs/wchisp"
license=('GPL-2.0-only')
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
options=('!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('3e8b4ef4ed6ab41db1d6ac65bdc3a8e9570d43d2e876551a8896f89973997ecf')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"
    #     install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-wchisp.rules" <<EOF
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8010" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="4348" ATTR{idProduct}=="55e0" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8012" MODE:="0666"
EOF
}
