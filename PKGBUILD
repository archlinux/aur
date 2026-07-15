# Maintainer: Tim Culverhouse <tim at timculverhouse dot com>

pkgname=rush-shell-git
pkgver=r2810.504935f
pkgrel=1
pkgdesc='POSIX-facing shell with modern interactive features'
arch=(x86_64)
url='https://rush.horse'
license=(MIT)
depends=(
    glibc
    sqlite
)
makedepends=(
    git
    'zig>=0.16.0'
)
provides=("rush-shell=$pkgver")
conflicts=(rush rush-shell)
install=rush-shell.install
source=('rush::git+https://github.com/rockorager/rush.git')
b2sums=(SKIP)

pkgver() {
    printf 'r%s.%s' \
        "$(git -C rush rev-list --count HEAD)" \
        "$(git -C rush rev-parse --short=7 HEAD)"
}

prepare() {
    cd rush
    zig build --fetch -fsys=sqlite3
}

build() {
    cd rush
    rm -rf "$srcdir/rush-build"

    zig build install \
        --prefix "$srcdir/rush-build/usr" \
        --system zig-pkg \
        --release=safe \
        --build-id=sha1 \
        -Dcpu=baseline \
        -Dsysconfdir=/etc \
        -Ddatadir=/usr/share \
        -Dregister-shell=false \
        -fsys=sqlite3
}

package() {
    cp -a "$srcdir/rush-build/." "$pkgdir/"
    install -Dm644 "$srcdir/rush/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
