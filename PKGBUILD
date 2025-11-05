# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.1.0
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
sha512sums=('76bac5fdd0a56ea31505b5bfa28b93f60c062e3285fb509afe09d7650bbe50fc705336840c80672fa88f4fdb496de687db2ded7c19105243c90eaea1adefe9fb')
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
