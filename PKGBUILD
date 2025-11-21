# Maintainer: Jiří Sejkora <sejsel@sejsel.cz>
pkgname=ksplang
pkgver=0.2.0
pkgrel=1
pkgdesc="An interpreter for ksplang"
arch=('x86_64')
url="https://github.com/ksp/ksplang"
license=('MIT')
depends=()
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ksp/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('28b25e2c2f175bac07f9d2d9874f87fd9f09bca316703f9318f15e57df0d3cb420f4ff624197fb8d2e5fe5dc54ac59fd070d34571fee4a4f5585b59d8cc49103')

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
