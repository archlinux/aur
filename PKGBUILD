# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=csharp-language-server
_pkgver=5.4.0-2.26060.1
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='A wrapper around Roslyn language server which makes compatible with editors other than VSCode'
arch=('x86_64')
url='https://github.com/SofusA/csharp-language-server'
license=('MIT')
depends=('gcc-libs' 'glibc' 'dotnet-runtime')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SofusA/csharp-language-server/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('8698f42eb786d2cea1086fad9bd3c7a5bb5ff88746530953327eb101d0b2af29')

prepare() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$pkgname-$_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$_pkgver"

    install -Dm755 "target/release/csharp-language-server" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
