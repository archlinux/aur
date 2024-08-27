# Maintainer: Katzper Michno <katzper.michno@gmail.com>
pkgname="overleaf-sync"
binaryname="olsync"
pkgver="0.2.0"
pkgrel="1"
pkgdesc="CLI for synchronizing LaTeX projects between Overleaf and your local machine"
arch=("x86_64")
url="https://github.com/km1chno/overleaf-sync-rs"
license=("MIT")
depends=("gcc-libs" "glibc" "openssl" "bzip2" "python" "python-pipx")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0e60a363a90f8ce2fd9f53cf868449aab762d5570dc9f8c9f3aa0ea21fb8c0c01a9acc1ef765179db12029bfab36476824118cb6eb002d738dc227f1c8b1aa85')

build() {
    cd "$srcdir/$pkgname-rs-$pkgver/olsync"
    export RUSTUP_TOOLCHAIN=nightly
    # Due to: https://github.com/mozilla/sccache/issues/862#issuecomment-2186738388
    CFLAGS+=' -ffat-lto-objects'
    cargo build --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-rs-$pkgver/olsync/target/release/$binaryname"

    cd "$srcdir/$pkgname-rs-$pkgver/socketio-client"
    pipx install .
    pipx runpip olsync-rs-socketio-client install -r requirements.txt
}
