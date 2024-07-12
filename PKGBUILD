# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

pkgver=0.1.2.1
pkgrel=1

arch=("x86_64")
options=(!lto)
depends=("glibc" "gcc-libs" "bzip2")
makedepends=("cargo")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Umatriz/nomi/archive/refs/tags/0.2.1.tar.gz"
)
sha256sums=('a7691344c2c9088801ccb826d973c4d6eac3c6f655c7ba5194791ab999ddda06')

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
