# Maintainer: neolaner <neo.laner.official@gmail.com>
pkgname=pkgsync-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive TUI for keeping explicitly-installed packages of two Arch Linux machines in sync"
arch=('x86_64')
url="https://github.com/NeoLaner/pkgsync"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('pkgsync')
conflicts=('pkgsync')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NeoLaner/pkgsync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf330df297aba23439ebd33495228aaed792508fd2ef2415dfef263da4c8d2a3')

_srcdir=pkgsync-$pkgver

prepare() {
    cd "$_srcdir"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/pkgsync"
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
