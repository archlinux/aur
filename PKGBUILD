# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.1.1
pkgrel=1
pkgdesc="Clipboard history manager for Wayland, inspired by cliphist"
provides=("$pkgname")
conflicts=("$pkgname")
arch=('x86_64' 'aarch64')
url="https://github.com/rolv-apneseth/clipvault"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
optdepends=(
    'wl-clipboard: update history on Wayland clipboard events (recommended way to use clipvault)'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('539e21aee87abb12975974a393513468b1e65923736260b7ccc06d6d21c2df07964261233948115f60031053f1081c1760dc27898910d4fa37ddd25115bbdf8e')
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
