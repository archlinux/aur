# Maintainer: CallMeAlphabet
pkgname=fastcp
pkgver=0
pkgrel=1
pkgdesc="fastcp, a fast cp wrapper using --reflink=always, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcp"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('fastcp')
conflicts=('fastcp-bin')
source=("fastcp-$pkgver.tar.gz::https://github.com/CallMeAlphabet/fastcp/archive/refs/tags/latest.tar.gz")
sha256sums=('SKIP')

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/fastcp-$pkgver.tar.gz" --strip-components=1 -C "$srcdir/build"
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
    install -Dm755 "target/release/fastcp" "$pkgdir/usr/bin/fastcp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
