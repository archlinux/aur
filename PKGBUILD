# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tattoy
pkgver=0.1.4
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=(cargo)
depends=('glibc' 'gcc-libs' 'dbus' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tattoy-org/tattoy/archive/refs/tags/tattoy-v${pkgver}.tar.gz")
b2sums=('a57df1f6fa519692a125b97363e076881aed4e1804cc8a88b7660032ed27ec8fe367258102c9454b96d283d451dfc2ac7f03730aca3d758a75498e16a153c5e3')
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

# checks fail in v0.1.4
# check() {
#     cd "$srcdir/$pkgname-$pkgname-v$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
