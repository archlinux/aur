# Maintainer: CallMeAlphabet
pkgname=fastmc
pkgver=1
pkgrel=1
pkgdesc="fastmc, create a Minecraft server in under a minute, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastmc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
provides=('fastmc')
conflicts=('fastmc-bin')
source=("fastmc-$pkgver.tar.gz::https://github.com/CallMeAlphabet/fastmc/archive/refs/tags/latest.tar.gz")
sha256sums=('SKIP')

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/fastmc-$pkgver.tar.gz" --strip-components=1 -C "$srcdir/build"
    cd "$srcdir/build"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/build"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    unset LDFLAGS CFLAGS CXXFLAGS
    cargo build --frozen --release
}

package() {
    cd "$srcdir/build"
    install -Dm755 "target/release/fastmc" "$pkgdir/usr/bin/fastmc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
