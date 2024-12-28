# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp
pkgver=0.3.0
pkgrel=1
pkgdesc="WCH ISP Tool in Rust"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/ch32-rs/wchisp"
license=('GPL-2.0-only')
provides=(${pkgname})
conflicts=(${pkgname}-git)
replaces=()
depends=(
    gcc-libs
    glibc
    libusb
    systemd-libs)
makedepends=(
    cargo
    rust)
backup=()
options=('!lto')
install=
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('b915a23df6c2e6d6f7d8dd680ea33bc78123040e3ff8860bcc68cf103c7b021d')

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
