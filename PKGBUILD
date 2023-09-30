# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-sponsorblock
_pkgver=2.0.0-alpha.4
pkgver=2.0.0alpha4
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching YouTube videos'
arch=('x86_64')
url='https://github.com/TheCactusVert/mpv-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
b2sums=('65950242324187c8e7268a113690ef0e6b3def2567f475cfa0c2a57e306fc1f52a43b036904970645666b47b2dfcc729a77fa8dc83c225d8dc779d848c7d38cb')
options=(!lto)

prepare() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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

    install -Dm644 -t "$pkgdir/usr/share/$pkgname" sponsorblock.toml
    install -Dm755 target/release/libmpv_sponsorblock.so "$pkgdir/usr/lib/$pkgname/sponsorblock.so"
    install -dm755 "$pkgdir/etc/mpv/scripts/"
    ln -s "/usr/lib/$pkgname/sponsorblock.so" "$pkgdir/etc/mpv/scripts/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
