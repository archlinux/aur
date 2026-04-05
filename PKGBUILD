# Maintainer: Anton Barchukov <anton@barchukov.com>
pkgname=limux
pkgver=0.0.1
pkgrel=1
pkgdesc="GPU-accelerated terminal workspace manager for Linux"
arch=('x86_64')
url="https://github.com/am-will/limux"
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('zig' 'cargo' 'git')
source=("$pkgname-$pkgver::git+https://github.com/am-will/limux.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    git submodule update --init --recursive
    cd ghostty && zig build -Dapp-runtime=none -Doptimize=ReleaseFast
    cd .. && cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/limux "$pkgdir/usr/bin/limux"
    install -Dm644 ghostty/zig-out/lib/libghostty.so "$pkgdir/usr/lib/limux/libghostty.so"
}
