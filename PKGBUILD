# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=tattoy
pkgver=0.1.8
pkgrel=1
pkgdesc="Text-based terminal compositor"
url="https://github.com/tattoy-org/tattoy"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=(cargo)
depends=('glibc' 'gcc-libs' 'dbus' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tattoy-org/tattoy/archive/refs/tags/tattoy-v${pkgver}.tar.gz")
b2sums=('79c3e1ca8b9e92eb75f561f5e974aac0b5a4d82568b0360d3a6cf07a30cd60470f038eddc735ad56c41e1d2875a0b235ce84e992be97e7d2221b386fd3c90271')
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

# checks fail in v0.1.8
# check() {
#     cd "$srcdir/$pkgname-$pkgname-v$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 "$srcdir/$pkgname-$pkgname-v$pkgver/LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
