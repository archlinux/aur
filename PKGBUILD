# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp
pkgver=0.2.2
pkgrel=12
pkgdesc="WCH ISP Tool in Rust"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/ch32-rs/wchisp"
license=('GPL-2.0-only')
provides=(${pkgname})
conflicts=(${pkgname}-git)
replaces=()
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!lto')
install=
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('6e9485d6b3d2073a20d8258d4b5f4ce628f7da93ab69d901de8f6cd348a2b1d8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
#     install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-wchisp.rules" <<EOF
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8010" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="4348" ATTR{idProduct}=="55e0" MODE:="0666"
SUBSYSTEM=="usb" ATTR{idVendor}="1a86" ATTR{idProduct}=="8012" MODE:="0666"
EOF
}
