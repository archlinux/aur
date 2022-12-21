# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-sponsorblock
_pkgver=99377ab4e724909a1b0f04b08d3ada8186999a42
pkgver=1.1.0
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching YouTube videos'
arch=('x86_64')
url='https://github.com/TheCactusVert/mpv-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo-nightly')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source=("$pkgname-$_pkgver.tar.gz::$url/archive/99377ab4e724909a1b0f04b08d3ada8186999a42.tar.gz")
sha256sums=('3071bccc00901bdc313439d3fad129c308f114bd11a194301a35c7a8ddb606c1')

prepare() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --target "$CARCH-unknown-linux-gnu"
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
