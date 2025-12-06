# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=crates-lsp
pkgver=0.4.3
pkgrel=1
pkgdesc="Language Server implementation for Cargo.toml"
provides=("$pkgname")
conflicts=("$pkgname")
arch=('x86_64' 'aarch64')
url="https://github.com/MathiasPius/crates-lsp"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('738eb7e4e76a03c06a2360412ebb457d8d58cabaff6084425dd43b9b3195ab7396e25f75474ef5f209aeee21e1035258c862252e5b33dcfc0af8e847f74fc66c')
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

package()
{
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
