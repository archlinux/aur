# Maintainer: dayvster <dayvi dot schuster at protonmail dot com>

# kwinctl is plain Zig with no dependencies and no libc: a single static binary.
pkgname=kwinctl
pkgver=0.1.0
pkgrel=1
pkgdesc="List and control KDE Plasma 6 windows from the command line"
arch=('x86_64')
url="https://github.com/dayvster/kwinctl"
license=('MIT')
depends=('kwin')
makedepends=('zig>=0.17')
# Zig already strips the binary, so a debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dayvster/kwinctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5d7d39af5d7b565a62deae4729526cef53cfc5ef3378e4188807dc244b425ef')

build() {
    cd "$pkgname-$pkgver"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
    # Baseline x86-64 rather than Zig's default of the build machine's own CPU.
    zig build -Doptimize=ReleaseSmall -Dcpu=baseline --prefix "$srcdir/install"
}

check() {
    cd "$pkgname-$pkgver"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
    zig build test -Dcpu=baseline
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$srcdir/install/bin/kwinctl" "$pkgdir/usr/bin/kwinctl"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
