# Maintainer: aquova <mail at aquova dot net>

pkgname=jgenesis
pkgver=0.10.1
pkgrel=1
pkgdesc="Sega Genesis / Sega CD / SNES / Master System / Game Gear Emulator"
arch=("x86_64")
url="https://github.com/jsgroth/jgenesis"
license=("MIT")
depends=("sdl2")
makedepends=("cargo")
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "jgenesis.desktop"
)
sha256sums=(
    "36489ecf093b44ddaf697934d12bfc68e7d81c361e4ccd07ea3541a479f55273"
    "6f75d9e1a31f0f5437495a32edc21addd0b85020a3ebc8921ef1d48419036746"
)

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/jgenesis-${pkgver}
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C target-cpu=native"
    export CFLAGS+=" -ffat-lto-objects"
    cd $srcdir/jgenesis-${pkgver}
    cargo build --frozen --profile release-lto -p jgenesis-gui
}

package() {
    cd $srcdir/jgenesis-$pkgver
    install -Dm775 target/release-lto/jgenesis-gui $pkgdir/usr/bin/jgenesis-gui
    install -Dm644 frontend/32x32.png $pkgdir/usr/share/pixmaps/jgenesis.png
    install -Dm644 $srcdir/jgenesis.desktop $pkgdir/usr/share/applications/jgenesis.desktop
}
