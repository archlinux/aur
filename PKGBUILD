# Maintainer: Navi Hex <navihx@foxmail.com>
pkgname=sendme
pkgver=0.30.0
pkgrel=0
pkgdesc="A tool to send files and directories, based on iroh"
arch=('any')
url="https://github.com/n0-computer/sendme"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('9e32131052ba08d8eb64213ca6633495b6befeebc03d585818a21fdc5e1ed797b1cdd56cce12080a0b4a09ce9c4b9ce457cc27a18b3d64c79250f020d1712a73')

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
