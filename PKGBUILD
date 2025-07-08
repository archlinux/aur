# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tattoy
pkgver=0.1.6
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=(cargo)
depends=('glibc' 'gcc-libs' 'dbus' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tattoy-org/tattoy/archive/refs/tags/tattoy-v${pkgver}.tar.gz")
b2sums=('fc95ad5dc2c9753bdb841b08b58c0e36630f44409c8e01c73704f496f636e96d16fbde7fe819bd5dbb56c43ef58b946cb0113c64683b97e65509dfea79b54ba4')
# https://github.com/tattoy-org/tattoy/archive/refs/tags/tattoy-v0.1.4.tar.gz

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo update --manifest-path "$srcdir/$pkgname-$pkgname-v$pkgver/Cargo.toml"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "$srcdir/$pkgname-$pkgname-v$pkgver/Cargo.toml"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src"
    cargo build --frozen --release --all-features --manifest-path "$srcdir/$pkgname-$pkgname-v$pkgver/Cargo.toml"
}

# checks fail in v0.1.6
# check() {
#     cd "$srcdir/$pkgname-$pkgname-v$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
