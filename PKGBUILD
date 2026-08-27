# Maintainer: CallMeAlphabet
pkgname=fasthex
pkgver=21
pkgrel=2
pkgdesc="fasthex, a very fast hex dumper, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('rustup')
provides=('fasthex')
conflicts=('fasthex-bin')
_commit=1c0e9e91cfee83f0b1bc2d5e337aa56728588bd4
source=("fasthex-$pkgver-$_commit.tar.gz::https://github.com/CallMeAlphabet/fasthex/archive/$_commit.tar.gz")
sha256sums=('SKIP')

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/fasthex-$pkgver-$_commit.tar.gz" --strip-components=1 -C "$srcdir/build"
    cd "$srcdir/build"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/build"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/build"
    install -Dm755 "target/release/fasthex" "$pkgdir/usr/bin/fasthex"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
