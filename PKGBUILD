# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=random-rs
pkgver=0.1.0
pkgrel=3
pkgdesc='Simple CLI multitool'
url='https://github.com/one-d-wide/random-rs'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=(GPL3)
provides=('random')
conflicts=('random')
depends=('gcc-libs')
makedepends=('git' 'rustup')
source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fda45b9efab1c4eb27ef504ac42c9e45294177c9c12c28c83c4cfb31534c151e')

_echo() {
    echo Running: $@
    $@
}

prepare() {
    cd "$pkgname-$pkgver"
    _echo rustup toolchain install nightly
    _echo rustup component add --toolchain nightly rust-src
    cat >>Cargo.toml <<EOF
[profile.filesize]
inherits = 'release'
opt-level = 's'
debug = false
lto = true
panic = 'abort'
incremental = false
rpath = true
strip = 'symbols'
EOF
    _echo cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    _echo cargo +nightly build --target "$CARCH-unknown-linux-gnu" --profile filesize -Z build-std-features=panic_immediate_abort -Z build-std=std,panic_abort
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/filesize/$pkgname" -t "$pkgdir/usr/bin"
    ln -s random-rs "$pkgdir/usr/bin/random"
}

