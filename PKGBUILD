# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=omaro
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI for lobste.rs. Browse posts and comments from the comfort of your terminal"
arch=('x86_64')
url="https://github.com/rolv-apneseth/omaro"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7690835556315e821f1e5999e9e74805eb8901e24a094a8893cd7db4033a92918d25111b0643f24a10fba31ef5415d5ec88d712fb5bf0da831e01f32374b0b01')
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
