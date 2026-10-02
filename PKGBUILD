# Maintainer: yuna0x0 <yuna@yuna0x0.com>
pkgname=obsidian2web-git
pkgver=1.4.0.r48.g4700798
pkgrel=3
pkgdesc="lun-4's obsidian publish knockoff that generates (largely static) websites"
arch=('x86_64' 'aarch64')
url="https://github.com/lun-4/obsidian2web"
license=('MIT')
provides=("obsidian2web=$pkgver-$pkgrel")
conflicts=('obsidian2web')
makedepends=('git' 'anyzig')
source=("$pkgname::git+https://github.com/lun-4/obsidian2web.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    # Fetch zig dependencies up front so build() runs offline
    anyzig build --fetch --global-cache-dir "$srcdir/zig-global-cache"
}

build() {
    cd "$srcdir/$pkgname"
    anyzig build --summary all --global-cache-dir "$srcdir/zig-global-cache" \
        -Dtarget="$CARCH-linux-musl" -Dcpu=baseline -Doptimize=ReleaseSafe
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "zig-out/bin/obsidian2web" "$pkgdir/usr/bin/obsidian2web"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
