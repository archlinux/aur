# Maintainer: Navi Hex <navihx@foxmail.com>
pkgname=sendme
pkgver=0.20.0
pkgrel=0
pkgdesc="A tool to send files and directories, based on iroh"
arch=('any')
url="https://github.com/n0-computer/sendme"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('cd40a3b22bcee42d16d9fab49aed12be9418e9b203e40a287a23bec472e86697e02d1e17637c2ab8a9c8c5c3b9ff0873f0aff94337cc6ea63c8a4708d046f931')

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
