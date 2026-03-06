# Maintainer: Michael König <m.koenig@kit.edu>
pkgname=bwlog
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight Linux system logger for per-core CPU, NIC throughput, and interrupt rates"
arch=('x86_64')
url="https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/v$pkgver.tar.gz")
sha256sums=('d6284c78d6d80ca69b1427ba30e8a0997769576711190e88275b07beb783ddd8')


prepare() {
    cd "$pkgname-v$pkgver-"*
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-v$pkgver-"*
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo build --release --locked
}

package() {
    cd "$pkgname-v$pkgver-"*

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell completions (generated at package time from the built binary)
    install -Dm644 <("target/release/$pkgname" --completions bash) \
        "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 <("target/release/$pkgname" --completions zsh) \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 <("target/release/$pkgname" --completions fish) \
        "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
