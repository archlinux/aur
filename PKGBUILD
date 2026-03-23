# Maintainer: taotieren <admin@taotieren.com>

pkgname=ptouch-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Brother P-Touch label printer driver and tools for Linux"
arch=($CARCH)
url="https://github.com/vowstar/ptouch-rs"
license=('MTI AND Apache-2.0 AND OFL-1.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    libgcc
    libusb
)
makedepends=(
    git
    rust
)
backup=()
options=('!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('c248e00c9069fbc3c07ae5fa72b622fa9edaf1c881db357f3e89146963f18511')

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
    cargo build --release --all-features --workspace
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features --workspace
# }

package() {
    cd "${srcdir}/${pkgname}/"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -vDm0755 -t "$pkgdir/usr/bin/" {} +

    install -vDm644 udev/20-usb-ptouch-permissions.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm644 crates/ptouch-gui/assets/fonts/DroidSansFallback-Apache2.0.txt -t "$pkgdir/usr/share/licenses/$pkgname/" 
    install -vDm644 crates/ptouch-gui/assets/fonts/NotoEmoji-OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/" 
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=ptouch-gui
Icon=${pkgname}.png
Name=${pkgname}
Terminal=false
Type=Application

EOF
}
