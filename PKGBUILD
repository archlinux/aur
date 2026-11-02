# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=m-flasher
pkgver=0.7.0
pkgrel=1
pkgdesc="Back up, restore and reinstall the firmware of an M-VAVE FM-1 or SMK-37"
arch=('x86_64' 'armv7h')
url="https://github.com/jvitkauskas/m-flasher"
license=('MIT')
depends=('glibc' 'libgcc' 'systemd-libs')
makedepends=('cargo')
source=("https://github.com/jvitkauskas/m-flasher/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c1a6644ecbcc720062e762e8de3965e1310d71e7ef0b7a74d914abbd6519698752cb1fd9c739a96883dab3b539a5041dcb0f94b835f65f36f38184dc326e22ce')
sha256sums=('f0c577b52af94a02e47938ed72557c77913d7e365b3c67ccfb061f3b9fc2e696')

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
