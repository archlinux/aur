# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-sponsorblock
pkgver=1.1.0
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching YouTube videos'
arch=('x86_64')
url='https://github.com/TheCactusVert/mpv-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cf015fb4b5ea6c4f5f065fb02f67171fc2a9c45b4a766a7264f02c42bcfe6fe')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 -t "$pkgdir/usr/share/$pkgname" sponsorblock.toml
    install -Dm755 target/release/libmpv_sponsorblock.so "$pkgdir/usr/lib/$pkgname/sponsorblock.so"
    install -dm755 "$pkgdir/etc/mpv/scripts/"
    ln -s "/usr/lib/$pkgname/sponsorblock.so" "$pkgdir/etc/mpv/scripts/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
