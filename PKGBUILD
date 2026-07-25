# Maintainer: taotieren <admin@taotieren.com>

pkgname=ptouch-rs
pkgver=0.5.0
pkgrel=1
pkgdesc="Brother P-Touch label printer driver and tools for Linux"
arch=($CARCH)
url="https://github.com/vowstar/ptouch-rs"
license=('GPL-3.0-only AND MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    libusb
)
makedepends=(
    git
    rust
)
optdepends=(
    "noto-fonts-emoji:  Google Noto Color Emoji font"
    "ttf-dejavu: Font family based on the Bitstream Vera Fonts with a wider range of characters"
    "ttf-droid: General-purpose fonts released by Google as part of Android"
)
backup=()
options=('!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('cc5b641cdc783c6a9bf2bae1702afc870872c5555d25e3e6dcf008be9c6cb0f7')

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

    install -vDm644 data/udev/20-usb-ptouch-permissions.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -vDm644 data/io.github.vowstar.ptouch-gui.desktop -t "${pkgdir}/usr/share/applications/"
    install -vDm644 data/io.github.vowstar.ptouch-gui.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -vDm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
