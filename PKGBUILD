# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=fake-rs
pkgver=5.0.0
pkgrel=1
pkgdesc="Command line tool for generating fake data in different languages"
arch=('x86_64')
url="https://github.com/cksac/fake-rs"
license=('Apache-2.0 OR MIT')
depends=(
    libgcc
    glibc
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5eaca199997c429b8417ac9bcbde9ebb3c48dd0e2a7d052fed366434e289f62fc713bb6785e2d37c978f0887a9146bb7e700cfd96cf7e142754bd665bedb5fa6')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features=cli
}

package()
{
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 $(echo "target/release/$pkgname" | sed 's/-rs//') -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname-MIT"
    install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname-APACHE"
}
