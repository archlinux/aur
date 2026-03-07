# Maintainer: ToxicByte (aka. KylerianHD) <contact@kylerianhd.com>
pkgname=af-pro-display-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Service that displays CPU and GPU temperatures on the Antec Flux Pro case display."
arch=('x86_64')
url="https://github.com/KylerianHD/af-pro-display-bin"
license=('GPL-3.0-only')
depends=('systemd' 'gcc-libs')
makedepends=('rust' 'cargo')
install="$pkgname.install"
_sourcepkgname=af-pro-display
source=("$_sourcepkgname-$pkgver.tar.gz::https://github.com/nishtahir/antec-flux-pro-display/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e036ab7f8ebacc65a6df0ec97d3fcb5397edb5d8f98e917eebd2d4cb27f362b')

prepare() {
    cd "antec-flux-pro-display-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "antec-flux-pro-display-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "antec-flux-pro-display-$pkgver"

    # Binary
    install -Dm755 "target/release/af-pro-display" \
        "$pkgdir/usr/bin/af-pro-display"

    # udev rules - grants session-based USB access via uaccess tag (no plugdev group needed)
    install -Dm644 "packaging/udev/99-af-pro-display.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-af-pro-display.rules"

    # systemd service (not auto-enabled; user enables manually per Arch guidelines)
    install -Dm644 "packaging/systemd/af-pro-display.service" \
        "$pkgdir/usr/lib/systemd/system/af-pro-display.service"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

