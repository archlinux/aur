# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=bibavpn
pkgver=1.3.0
pkgrel=1
pkgdesc="DPI-resistant SOCKS5/HTTP tunnel over TLS+WebSocket (server, client, invite minter)"
arch=('x86_64')
url="https://github.com/Eljaja/BibaVPN"
license=('MIT')
# ring ships prebuilt asm/C objects; makepkg LTO turns them into bitcode that
# lld cannot resolve against the Rust crate -> undefined ring_core_* symbols.
options=('!lto')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7a8bfef80f1ff73697cceb97c533f9da50e40fab46eb51d310f1673259df1e9')

latestver() {
    git ls-remote --tags --refs "$url" |
        sed -nE 's@.*refs/tags/v([0-9]+(\.[0-9]+)*)$@\1@p' | sort -V | tail -1
}

prepare() {
    cd "BibaVPN-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "BibaVPN-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release -p bibavpn
}

package() {
    cd "BibaVPN-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" \
        target/release/bibavpn-server \
        target/release/bibavpn-client \
        target/release/bibavpn-mint-invite
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
