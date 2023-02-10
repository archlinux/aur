# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
pkgname=mpv-sponsorblock
_pkgver=2.0.0-alpha.3
pkgver=2.0.0alpha3
pkgrel=1
pkgdesc='MPV plugin that allow you to skip sponsors while watching YouTube videos'
arch=('x86_64')
url='https://github.com/TheCactusVert/mpv-sponsorblock'
license=('MIT')
depends=('mpv')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('486ce8a6a72f3ad00810bf66425d9fa67db8ee04bfc54eae5223622fff6c4980')

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
