# Maintainer: Eliot <eliotjoking <at> gmail <dot> com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-bilibili-sponsorblock
_pkgver=0.1.1
pkgver=0.1.1
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching Bilibili videos '
arch=('x86_64')
url='https://github.com/test482/mpv-bilibili-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
b2sums=('5412667f8ef7b2e9bae2872162d03dfe270c02b7439613d62d7a704090a9011adfa62523234c70df2de98e4d84c959a6c7f8cc72df0d0100c7cae1750ce36b7f')
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
