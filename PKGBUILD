# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.0.5
pkgrel=1
pkgdesc="Clipboard history manager for Wayland, inspired by cliphist"
arch=('x86_64')
url="https://github.com/rolv-apneseth/clipvault"
license=('AGPL3')
depends=('gcc-libs')
optdepends=(
    'wl-clipboard: update history on Wayland clipboard events (recommended way to use clipvault)'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4e12a178ea7e2d3affe15497ea7a8d950e8d81437eb25bb4ba0690eba84ea25759511db6728f47baff8808b6cb649266e3bbd7437c36686765492fcfdd54813b')
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
