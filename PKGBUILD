# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

pkgver=0.2.3
pkgrel=1

arch=("x86_64")
options=(!lto)
depends=("glibc" "gcc-libs" "bzip2")
makedepends=("cargo")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Umatriz/nomi/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('e99529ce9fca034e1eb2238038b4cedda65f0efa9441456405b57bb1bbcdd69c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-targets
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/client" "$pkgdir/usr/bin/nomi"
}
