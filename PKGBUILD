# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=omaro
pkgver=0.1.4
pkgrel=1
pkgdesc="TUI for lobste.rs. Browse posts and comments from the comfort of your terminal"
arch=('x86_64')
url="https://github.com/rolv-apneseth/omaro"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('44304f7287812c8fa344ae7d0d7673d2000cf3374733c35b1d6f8d0f2dea54c98ba0917031607c2ccd49bd5047a90e8db348aad9807528ac966f48e60653e282')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package()
{
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
