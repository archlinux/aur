# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

pkgver=0.1.2
pkgrel=1

arch=("x86_64")
options=(!lto)
depends=("glibc" "gcc-libs" "bzip2")
makedepends=("cargo")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Umatriz/nomi/archive/refs/tags/v0.1.2-fixed.tar.gz"
)
sha256sums=('bff133ec08a7909476cfdda166c5a0e0761039c9fb064678dfb7ad58d33e8ac9')

prepare() {
    cd $(find $srcdir/* -maxdepth 0 -type d)
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $(find $srcdir/* -maxdepth 0 -type d)
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-targets
}

package() {
    install -Dm755 "$(find $srcdir/* -maxdepth 0 -type d)/target/release/client" "$pkgdir/usr/bin/nomi"
}
