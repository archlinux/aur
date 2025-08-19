# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=omaro
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI for lobste.rs. Browse posts and comments from the comfort of your terminal"
arch=('x86_64')
url="https://github.com/rolv-apneseth/omaro"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0300208a801b200a3fb839f3176e8235e4061cc9c2b4ed8918fd339c389dda68a3d32c6cd1478d7c77d9411022b1abda6dba7def8fdf07cd833612296a2a599c')
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
