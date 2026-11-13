# Maintainer: Michael König <m.koenig@kit.edu>
pkgname=bwlog
pkgver=0.5.2
pkgrel=1
pkgdesc="Lightweight logger for network throughput, CPU utilization, and interrupt rates"
arch=('x86_64')
url="https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/v$pkgver.tar.gz")
sha256sums=('b6bd6aed8453bf68387b8cdd109064522ffe28039c1579eb7931ddfe316a4e8d')

prepare() {
    cd "$pkgname-v$pkgver-"*
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-v$pkgver-"*
    # GitLab names the archive folder bwlog-v<version>-<commit>; bwlog's
    # build.rs records this commit in the output metadata.
    export BWLOG_GIT_COMMIT="${PWD##*-}"
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
