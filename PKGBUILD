# Maintainer: Katzper Michno <katzper.michno@gmail.com>
pkgname="overleaf-sync"
binaryname="olsync"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="CLI for synchronizing LaTeX projects between Overleaf and your local machine"
arch=("x86_64")
url="https://github.com/km1chno/overleaf-sync-rs"
license=("MIT")
depends=("gcc-libs" "glibc" "openssl" "bzip2" "python" "python-pipx")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e34eefcd3b6288e3579246f1577a53bc11c6ec2423f9995c22e17ba2b9047f37e8674809696286adebf76dcfcc1b4f519ecaf878f0190b5f219e4ec509699fb2')

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
