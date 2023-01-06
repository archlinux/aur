# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-sponsorblock
_pkgver=2.0.0-alpha.2
pkgver=2.0.0alpha2
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching YouTube videos'
arch=('x86_64')
url='https://github.com/TheCactusVert/mpv-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('9f9b1f383c505dfad86aaa90c3301fde04541cabc2e482c00586c0d36ff1707a')

prepare() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen
}

package() {
    cd "$pkgname-$_pkgver"

    install -Dm644 -t "$pkgdir/usr/share/$pkgname" sponsorblock.toml
    install -Dm755 target/release/libmpv_sponsorblock.so "$pkgdir/usr/lib/$pkgname/sponsorblock.so"
    install -dm755 "$pkgdir/etc/mpv/scripts/"
    ln -s "/usr/lib/$pkgname/sponsorblock.so" "$pkgdir/etc/mpv/scripts/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
