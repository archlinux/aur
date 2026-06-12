# Maintainer: Dish <needed@tutamail.com>
pkgname=dish
pkgver=0.6.8
pkgrel=1
pkgdesc="It shell"
arch=('x86_64')
url="https://codeberg.org/D1SH/Dish"
license=('GPL3')
depends=()
makedepends=('rustup' 'curl' 'tar' 'binutils')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    "$CARCH-linux-musl-cross.tgz::https://musl.cc/$CARCH-linux-musl-cross.tgz"
)
sha256sums=(
    '527d38fe1dfa4710316b1be753ee3966c6aede7f1ffc6829e7d5f796eeafa607'
    'c5d410d9f82a4f24c549fe5d24f988f85b2679b452413a9f7e5f7b956f2fe7ea'
)
noextract=('$CARCH-linux-musl-cross.tgz')

prepare() {
    tar xf "$srcdir/$CARCH-linux-musl-cross.tgz" -C "$srcdir"
    ar rcs "$srcdir/$CARCH-linux-musl-cross/$CARCH-linux-musl/lib/libunwind.a"

    rustup toolchain install nightly
    rustup component add rust-src --toolchain nightly
}

build() {
    cd "dish"

    local gcc="$srcdir/$CARCH-linux-musl-cross/bin/$CARCH-linux-musl-gcc"
    local lib="$srcdir/$CARCH-linux-musl-cross/$CARCH-linux-musl/lib"
    local gcc_lib="$srcdir/$CARCH-linux-musl-cross/lib/gcc/$CARCH-linux-musl/11.2.1"

    RUSTFLAGS="-Z unstable-options -C panic=immediate-abort -C linker=$gcc -L $lib -L $gcc_lib" \
    cargo +nightly build \
        -Z build-std=std \
        -Z unstable-options \
        --target $CARCH-unknown-linux-musl \
        --release
}

package() {
    cd "dish"
    install -Dm755 "target/$CARCH-unknown-linux-musl/release/dish" \
        "$pkgdir/usr/bin/dish"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
