# Maintainer: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.5.0
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c43e0202f5457b48558096cb7b36d0e473f267551a89c82ed72d73b01dfd4007')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Clang+LLD needed in place of GCC+BFD if LTO is enabled or final linking fails
    export CC=clang
    export CFLAGS+=" -fuse-ld=lld"
    export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"
    cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
