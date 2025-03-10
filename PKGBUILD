# Maintainer: Eliot <eliotjoking <at> gmail <dot> com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-bilibili-sponsorblock
_pkgver=0.1.0
pkgver=0.1.0
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching Bilibili videos '
arch=('x86_64')
url='https://github.com/test482/mpv-bilibili-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
b2sums=('0b9de6d0e6992879c78dbc9c36db2a1b61c410a730dadc536a5172acd68ae3aac1ea587ae87a84de2fd516528a989e856451346facdadd03dcc1e07a90bc26af')
options=(!lto)

prepare() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$_pkgver"

    install -Dm644 -t "$pkgdir/usr/share/$pkgname" bilibili-sponsorblock.toml
    install -Dm755 target/release/libmpv_bilibili_sponsorblock.so "$pkgdir/usr/lib/$pkgname/bilibili_sponsorblock.so"
    install -dm755 "$pkgdir/etc/mpv/scripts/"
    ln -s "/usr/lib/$pkgname/bilibili_sponsorblock.so" "$pkgdir/etc/mpv/scripts/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
