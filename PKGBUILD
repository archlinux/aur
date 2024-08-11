# Maintainer: Katzper Michno <katzper.michno@gmail.com>
pkgname="overleaf-sync"
binaryname="olsync"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="CLI for synchronizing LaTeX projects between Overleaf and your local machine"
arch=("x86_64")
url="https://github.com/km1chno/overleaf-sync-rs"
license=("MIT")
depends=("gcc-libs" "glibc" "openssl" "bzip2" "python" "python-pipx")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('93883aa8a06f3f0451687d75c8fccd218161ed4b253e68796ef7e7d02b1b425da219c755fdcce5f356eea7ee61e8b7c2d9e30323b92a80fc17d23e28505f8a30')

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
