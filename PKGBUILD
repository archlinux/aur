# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=tdu-aegix-git
_pkgname=tdu
pkgver=r9.fd46423
pkgrel=1
pkgdesc="Aegix Linux's terminal disk usage: an instant device overview with chunky gruvbox bars and a one-level drill-down"
arch=('x86_64')
url="https://github.com/aegixlinux/tdu"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('tdu')
conflicts=('tdu')
source=("$_pkgname::git+https://github.com/aegixlinux/tdu.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    # tdu's Makefile hardcodes PREFIX; patch it to /usr for arch packaging.
    sed -i 's|^PREFIX = /usr/local|PREFIX = /usr|' Makefile
}

build() {
    cd "$_pkgname"
    make
}

check() {
    cd "$_pkgname"
    make test
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
