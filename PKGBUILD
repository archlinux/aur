# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=omaro
pkgver=0.1.2
pkgrel=1
pkgdesc="TUI for lobste.rs. Browse posts and comments from the comfort of your terminal"
arch=('x86_64')
url="https://github.com/rolv-apneseth/omaro"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('96ea9b86b57f742b84c38a1a7b5d19c40224ab77ce13f471bdfb552c3327117d680d1e84ae8f7da09ba8303f61286c88b89d57bd8dcbf999e967b127ebeced70')
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
