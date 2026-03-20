# Maintainer: aquova <mail at aquova dot net>

pkgname=jgenesis
pkgver=0.11.3
pkgrel=1
pkgdesc="Sega Genesis / Sega CD / SNES / Master System / Game Gear Emulator"
arch=("x86_64")
url="https://github.com/jsgroth/jgenesis"
license=("MIT")
makedepends=("cargo")
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "jgenesis.desktop"
)
sha256sums=(
    "520473a55b271b1919a429987b255c310fd83caa3baeb55bbf2365b613cd93d1"
    "6f75d9e1a31f0f5437495a32edc21addd0b85020a3ebc8921ef1d48419036746"
)

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C target-cpu=native"
    export CFLAGS+=" -ffat-lto-objects"
    cd $srcdir/jgenesis-${pkgver}
    cargo build --profile release-lto -p jgenesis-gui
    cargo build --profile release-lto -p jgenesis-cli
}

package() {
    cd $srcdir/jgenesis-$pkgver
    install -Dm775 target/release-lto/jgenesis-gui $pkgdir/usr/bin/jgenesis-gui
    install -Dm775 target/release-lto/jgenesis-cli $pkgdir/usr/bin/jgenesis-cli
    install -Dm644 frontend/32x32.png $pkgdir/usr/share/pixmaps/jgenesis.png
    install -Dm644 $srcdir/jgenesis.desktop $pkgdir/usr/share/applications/jgenesis.desktop
}
