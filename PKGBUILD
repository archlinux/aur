# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tattoy
pkgver=0.1.1
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=(cargo)
depends=('glibc' 'gcc-libs' 'dbus' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tattoy-org/tattoy/archive/refs/tags/v0.1.1.tar.gz")
b2sums=('3e5dc63983d98f571868d346f62c9c6a591625bcdefcffb4081ff097f021529ad90069cb6e457ca867fc697847dec8d81312e9f37dfb113a07a1c7d2fd88e7f8')

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

# checks fail in v0.1.1
#check() {
#    cd "$srcdir/$pkgname-$pkgver"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
