# Maintainer: Andrew Kozik <andrewkoz at live dot com>
pkgname=xwin
pkgver=0.6.3
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=('x86_64')
url="https://crates.io/crates/xwin"
license=('Apache' 'MIT')
depends=('glibc')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c2f51662ea5ff5e49b3693a340adbe7923f7fcd36dd2a52de8dacfe1865fb51e')

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
