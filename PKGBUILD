# Maintainer: pusi77 <pusineriandrea+gmail+com>
# Contributor: pusi77-robot <pusineriandrea+gmail+com>

pkgname=ciphey
pkgver=0.12.1
pkgrel=1
epoch=1
pkgdesc="Automatically decrypt encryptions without knowing the key or cipher, decode encodings, and crack hashes"
arch=('x86_64')
url="https://github.com/bee-san/Ciphey"
license=('MIT')
depends=('glibc' 'libgcc' 'oniguruma' 'openssl' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7c1e2a25d430abc13dcc7ce10be3978e27816d791caa241ed5f7e3ab9092ddd54f2cef42ef6835390b1dc4494b638a07e25db906143dace88e5f78c8529b48d2')

prepare() {
    cd "Ciphey-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "Ciphey-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export OPENSSL_NO_VENDOR=1
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --frozen --release --all-features
}

check() {
    cd "Ciphey-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export OPENSSL_NO_VENDOR=1
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo test --frozen --all-features
}

package() {
    cd "Ciphey-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
