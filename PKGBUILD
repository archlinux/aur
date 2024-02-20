# Maintainer: Jiří Sejkora <sejsel@sejsel.cz>
pkgname=ksplang
pkgver=0.1.0
pkgrel=1
pkgdesc="An interpreter for ksplang"
arch=('x86_64')
url="https://github.com/ksp/ksplang"
license=('MIT')
depends=()
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ksp/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('b8978d79729e3fef3b79edbccf3ce97a835ce04e81eea4e181917c8d88d8cfa0379e7297a1e32d9c079f0e9883cdb25b5affeeda059f027c8aab4b4400c4ab79')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p ksplang-cli --frozen --release --all-features
	mv target/release/ksplang-cli target/release/ksplang
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
