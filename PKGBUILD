# Maintainer: Andrew Arendt <andrewarendt at gmail dot com>

pkgname=ttypo
pkgver=0.1.21
pkgrel=1
pkgdesc="Terminal-based typing test"
arch=('x86_64' 'aarch64')
url="https://github.com/drewja/ttypo"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c8d345e22c4c9b62c184c2f872f2d30049fcc1c4b6117520534498de5d4e273')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
