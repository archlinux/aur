# Maintainer: PixelSergey <sergey.ichtchenko@gmail.com>

pkgname=meow
pkgver=2.1.5
pkgrel=1
pkgdesc='Print ASCII cats to your terminal!'
url='https://github.com/PixelSergey/meow'
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname-cli/$pkgname-cli-$pkgver.crate")
b2sums=('c50299ac2612a4585d53d0624630c2a7c03805d3eb370608ebd4ebfa126a47fd8c539a47c9cc772a6e67cc8f47a9bad2c94f8d5179c930e3c3dbbb2aa2fa9d21')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-cli-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname-cli-$pkgver
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-cli-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-cli-$pkgver
    mv "target/release/$pkgname-cli" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
