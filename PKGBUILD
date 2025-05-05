# Maintainer: Navi Hex <navihx@foxmail.com>
pkgname=sendme
pkgver=0.25.0
pkgrel=0
pkgdesc="A tool to send files and directories, based on iroh"
arch=('any')
url="https://github.com/n0-computer/sendme"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('de06f5d6a8ee182ca9e6009e0a1b0d3bb12752220756d4b915dae91df9cab26862f8753b2e66e31fa22acd36c793f0ee5cdb3a973fda53e6719ccc61132ec1be')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=' -ffat-lto-objects' cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    CFLAGS+=' -ffat-lto-objects' cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
