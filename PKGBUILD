# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=post-clock
pkgver=0.1.0
pkgrel=1
pkgdesc='A clock using the POST codes display'
arch=('x86_64' 'i686')
url='https://github.com/jonasmalacofilho/post-clock'
license=('Unlicense')
depends=(
    cargo
    gcc-libs
    glibc
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5204b80edcdb47ad969f2f8558a6f294fecc8d01cbc477faf3d74b91223d9cb2')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    export CARGO_TARGET_DIR=target

    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
}
