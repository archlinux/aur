# Maintainer: Ken <flat at esoteric dot moe>
# Contributor: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.9.0
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://github.com/Jake-Shadle/xwin"
license=('Apache' 'MIT')
depends=('glibc')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6878480d7a4126fb4390fe083ac0509bf43e4d284797e2ddd0a4a01fd614f35b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    # Clang+LLD needed in place of GCC+BFD if LTO is enabled or else final link fails
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CC=clang
    export CFLAGS+=" -fuse-ld=lld"
    export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Skip running tests that download files and require additional targets installed
    cargo test --frozen --bins --lib --examples
}

package() {
    cd "$pkgname-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE-*
}
