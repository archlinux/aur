# shellcheck shell=bash disable=SC2034
# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=ztty
pkgver=0.6.2
pkgrel=1
pkgdesc='Lightweight no_std Rust terminal emulator for X11, XWayland and native Wayland'
arch=('x86_64')
url='https://github.com/LIghtJUNction/ztty'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libx11' 'libxft' 'libxrender' 'fontconfig' 'freetype2' 'harfbuzz' 'libglvnd' 'wayland' 'libxkbcommon')
makedepends=('rustup' 'pkgconf' 'wayland-protocols')
optdepends=('xdg-utils: open hyperlinks' 'ttf-dejavu: default monospace font')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('942da0a3da79480a075902196d26496fc2de5736effa3086d0040903962cfe36')

prepare() {
    cd "$pkgname-$pkgver" || return
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver" || return
    cargo build --frozen --release --features wayland
}

check() {
    cd "$pkgname-$pkgver" || return
    cargo test --frozen --workspace --lib --features wayland
}

package() {
    cd "$pkgname-$pkgver" || return
    install -Dm755 target/release/ztty "$pkgdir/usr/bin/ztty"
    install -Dm644 assets/ztty.desktop "$pkgdir/usr/share/applications/ztty.desktop"
    sed -i 's|^Exec=.*|Exec=/usr/bin/ztty|' "$pkgdir/usr/share/applications/ztty.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
