# Maintainer: Navi Hex <navihx@foxmail.com>
pkgname=sendme
pkgver=0.24.0
pkgrel=0
pkgdesc="A tool to send files and directories, based on iroh"
arch=('any')
url="https://github.com/n0-computer/sendme"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('b42afd25a2ecaa56128c6152a7835853b25cd3680db7e397047bec2bf4277c63f586c957e48ef786858db6e720f42c4ba63e9f34c9b9949552327772242c8759')

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
