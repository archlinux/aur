# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.0.6
pkgrel=2
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
sha512sums=('6c3c23673087d2d71a40093de06588ca76c029769e2e8a5677d9ec5b7a187fe7a96b146b0ff351558c52226e1ea60bb31c535176b194f76656a6e7210a04350d')
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
