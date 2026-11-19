# shellcheck shell=bash disable=SC2034
# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=ztty
pkgver=0.4.1
pkgrel=1
pkgdesc='Lightweight no_std Rust terminal emulator for X11 and XWayland'
arch=('x86_64')
url='https://github.com/LIghtJUNction/ztty'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libx11' 'libxft' 'libxrender')
makedepends=('rustup')
optdepends=('xdg-utils: open hyperlinks' 'ttf-dejavu: default monospace font')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f8c4fbf1b6e0afcbc4c72d10caa23a4d57a21a845070f936bf601e44e01f1196')

prepare() {
    cd "$pkgname-$pkgver" || return
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver" || return
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver" || return
    cargo test --frozen --workspace --lib
}

package() {
    cd "$pkgname-$pkgver" || return
    install -Dm755 target/release/ztty "$pkgdir/usr/bin/ztty"
    install -Dm644 assets/ztty.desktop "$pkgdir/usr/share/applications/ztty.desktop"
    sed -i 's|^Exec=.*|Exec=/usr/bin/ztty|' "$pkgdir/usr/share/applications/ztty.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
