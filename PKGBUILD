# Maintainer: CallMeAlphabet
pkgname=fasthex
pkgver=10
pkgrel=1
pkgdesc="fasthex, a very fast hex dumper, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('fasthex')
conflicts=('fasthex-bin')
source=("fasthex-$pkgver.tar.gz::https://github.com/CallMeAlphabet/fasthex/archive/refs/tags/latest.tar.gz")
sha256sums=('SKIP')

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/fasthex-$pkgver.tar.gz" --strip-components=1 -C "$srcdir/build"
    cd "$srcdir/build"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/build"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/build"
    install -Dm755 "target/release/fasthex" "$pkgdir/usr/bin/fasthex"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
