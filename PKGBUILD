# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tattoy
pkgver=0.1.3
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=(cargo)
depends=('glibc' 'gcc-libs' 'dbus' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tattoy-org/tattoy/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c53a479af866ae7d00fa0099e495bffafa7bc234bc9bff0df0f97c4869a007f1025b4e8c48e1af64a04ff3d4a21cd138da93feb2bd513421d6f349e1c150afa3')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo update --manifest-path "$srcdir/$pkgname-$pkgver/Cargo.toml"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "$srcdir/$pkgname-$pkgver/Cargo.toml"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src"
    cargo build --frozen --release --all-features --manifest-path "$srcdir/$pkgname-$pkgver/Cargo.toml"
}

# checks fail in v0.1.3
#check() {
#    cd "$srcdir/$pkgname-$pkgver"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
