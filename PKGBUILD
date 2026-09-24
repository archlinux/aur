# Maintainer: VZstless <i [at] vzstless [dot] moe>

pkgname=stoolap
pkgver=0.4.2
pkgrel=1
pkgdesc="Modern Embedded SQL Database written in Rust"
arch=('x86_64')
url="https://github.com/stoolap/stoolap"
license=('Apache-2.0')
makedepends=('rust')
options=('!lto')
provides=('stoolap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('cd256e8ed00025c62d94298122bb2e36d54b956f483d17b81c98f4557c7c7501828d6a0a90a01733e8fa7dd82203e0d289c631b82de05555db4ac41bf03f6576')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
