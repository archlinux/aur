# Maintainer: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.5.1
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
depends=('glibc')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c13f18103ecd54342d0f923b33fff9ed595e5813e5af85620f1a8e7622474acb')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    # Clang+LLD needed in place of GCC+BFD if LTO is enabled or else final link fails
    export CC=clang
    export CFLAGS+=" -fuse-ld=lld"
    export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE-*
}
