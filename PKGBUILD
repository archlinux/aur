# Maintainer: Michael König <m.koenig@kit.edu>
pkgname=bwlog
pkgver=0.4.1
pkgrel=2
pkgdesc="Lightweight logger for network throughput, CPU utilization, and interrupt rates"
arch=('x86_64')
url="https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/v$pkgver.tar.gz")
sha256sums=('0ef092a2a2b022f44aaaf3695a2a6efcfa98c3db0841215b7ba0200ebbcd8f00')


prepare() {
    cd "$pkgname-v$pkgver-"*
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-v$pkgver-"*
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo build --release --frozen
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
