# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=qmk-hid
_srcname=qmk_hid
pkgver=0.1.11
pkgrel=3
pkgdesc="Commandline tool for interacting with QMK devices over HID"
arch=('x86_64')
url="https://github.com/FrameworkComputer/qmk_hid"
license=('BSD')
depends=('gcc-libs' 'systemd-libs' 'libcap')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e898d27cfe8350f4a8cd2938a3d066935093daf1292f41fc10b8f1937059f2b59e4ac34a987f26c8258a5d3b15a900059024fe3a18ed793f7e3b524939ab4c71')
options=('!lto')

prepare() {
    cd "$_srcname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_srcname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

#check() {
#    cd "$_srcname-$pkgver"
#
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$_srcname-$pkgver"
    install -Dm755 "target/release/$_srcname" "$pkgdir/usr/bin/$_srcname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
