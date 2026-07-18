# Maintainer: CallMeAlphabet
pkgname=fastwc
pkgver=0
pkgrel=1
pkgdesc="A fast wc rewrite (x86_64 Linux only) — builds from source, always tracks latest"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastwc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'curl')
provides=('fastwc')
conflicts=('fastwc-bin')
source=("fastwc-latest.tar.gz::https://github.com/CallMeAlphabet/fastwc/archive/refs/tags/latest.tar.gz")
sha256sums=('SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fastwc/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/fastwc-latest.tar.gz" --strip-components=1 -C "$srcdir/build"
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
