# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=m-flasher
pkgver=0.12.1
pkgrel=1
pkgdesc="Back up, restore and reinstall the firmware of an M-VAVE FM-1 or SMK-37"
arch=('x86_64' 'armv7h')
url="https://github.com/jvitkauskas/m-flasher"
license=('MIT')
depends=('glibc' 'libgcc' 'systemd-libs')
makedepends=('cargo')
source=("https://github.com/jvitkauskas/m-flasher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('719f21226dc3187e13f0a3a91f527bee725c13a42ca52388250906a4171c56d0')
b2sums=('669e61d25be77b59889ef268e21c6b4377edadaeff2cdd71410a6bbba39e984e3fb4fe468b4823d47ac663367c802d2e3fc7183f4eca5615a0594b3bb9edfbb2')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm0644 -t "$pkgdir/usr/lib/udev/rules.d/" "linux/70-m-flasher.rules"

    # Desktop file and icon
    install -Dm0644 "linux/m-flasher.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    install -Dm0644 "linux/package/io.github.jvitkauskas.m-flasher.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
