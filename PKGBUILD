# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.2.0
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
sha512sums=('20f87d10ce1ddaf60255a76247a190ea2f07b8608184c9cd5451e9c6e35f4e73c4b6268b25325804325f7bf8702506e9f6d97b15063dc625864f0c8ea508ad4d')
options=(!debug !lto)

prepare() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
