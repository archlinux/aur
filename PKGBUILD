# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=dwmblocks-aegix-git
_pkgname=dwmblocks
pkgver=r7.11a36ab
pkgrel=1
pkgdesc="Aegix Linux's custom build of dwmblocks (modular status bar for dwm) with aegix-flavored block config"
arch=('x86_64')
url="https://github.com/aegixlinux/dwmblocks"
license=('MIT')
depends=('libx11')
makedepends=('git')
provides=('dwmblocks')
conflicts=('dwmblocks')
source=("$_pkgname::git+https://github.com/aegixlinux/dwmblocks.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    # dwmblocks' Makefile hardcodes PREFIX; patch it to /usr for arch packaging.
    sed -i 's|^PREFIX = /usr/local|PREFIX = /usr|' Makefile
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
