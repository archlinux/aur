# Maintainer: CallMeAlphabet
pkgname=fastwc
pkgver=6
pkgrel=1
pkgdesc="fastwc, a fast wc rewrite, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastwc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
provides=('fastwc')
conflicts=('fastwc-bin')
source=("fastwc-$pkgver.tar.gz::https://github.com/CallMeAlphabet/fastwc/archive/refs/tags/latest.tar.gz")
sha256sums=('SKIP')

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/fastwc-$pkgver.tar.gz" --strip-components=1 -C "$srcdir/build"
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
    install -Dm755 "target/release/fastwc" "$pkgdir/usr/bin/fastwc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
