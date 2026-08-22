# Maintainer: aquova <mail at aquova dot net>

pkgname=jgenesis
pkgver=0.14.1
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
    "fcd21f3182b4fee6932d1aeb95e2807ee6218a7460d55d02ca725969cc564db2"
    "a95ba7ea825261fe78d374cf30b709f5ecfe6f9e830092c51e8bb823bf410f39"
)

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C target-cpu=native"
    export CFLAGS+=" -ffat-lto-objects"
    cd $srcdir/jgenesis-${pkgver}
    cargo build --profile release-lto
}

package() {
    cd $srcdir/jgenesis-$pkgver
    install -Dm775 target/release-lto/jgenesis $pkgdir/usr/bin/jgenesis
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 frontend/256x256.png $pkgdir/usr/share/pixmaps/jgenesis.png
    install -Dm644 $srcdir/jgenesis.desktop $pkgdir/usr/share/applications/jgenesis.desktop
}
