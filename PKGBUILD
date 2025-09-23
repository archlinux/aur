# Maintainer: Navi Hex <navihx@foxmail.com>
pkgname=sendme
pkgver=0.28.0
pkgrel=0
pkgdesc="A tool to send files and directories, based on iroh"
arch=('any')
url="https://github.com/n0-computer/sendme"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('3b857b290e24627d8264a8054b5152fadb02e049c2ea094a76e699593a578a042dfe3f9e24eecd79d9bc2c47a45a538b5969dbc2727a1d40fabe3952013f14ac')

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
