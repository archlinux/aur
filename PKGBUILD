# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
pkgname=graftcp-git
pkgver=r101.2225d95
pkgrel=1
pkgdesc="A flexible tool for redirecting a given program's TCP traffic to SOCKS5 proxy."
arch=("x86_64")
url="https://github.com/hmgle/graftcp"
license=("GPL")
depends=("glibc")
makedepends=("git" "go" "gcc" "make")
provides=("graftcp")
conflicts=("graftcp")
backup=("etc/graftcp-local.conf")
source=("$pkgname::git+https://github.com/hmgle/graftcp.git"
        "graftcp-local.service")
sha512sums=('SKIP'
            '9ab1e06b6a3fe25761a925babc74849673e4f5136410cc14c953b343ef5ea12a289dd67a1981b5fa5698792b3852708838f202b843efe1042a4b0b4892c73712')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/$pkgname"
    # graftcp's install target does something weird (it starts graftcp-local).
    # So we manually copy all binaries.
    install -Dm755 graftcp "$pkgdir/usr/bin/graftcp"
    install -Dm755 graftcp-local/graftcp-local "$pkgdir/usr/bin/graftcp-local"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 graftcp-local/example-graftcp-local.conf "$pkgdir/etc/graftcp-local.conf"
    install -Dm644 "$srcdir/graftcp-local.service" "$pkgdir/usr/lib/systemd/system/graftcp-local.service"
}
