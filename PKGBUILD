# Maintainer: osch <oliver@luced.de>
pkgname=lexiftool-git
pkgver=0.r1.g0ae7802
pkgrel=1
pkgdesc="Lua port of ExifTool: read and write image metadata, command-line tool and C API"
arch=('x86_64' 'aarch64')
url="https://github.com/blitzview-org/lexiftool"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
# the Lua modules lexiftool loads at run time (the launcher and the C API
# alike); the C libraries behind them are dependencies of those packages
depends=('lua' 'lua-filesystem' 'lua-lpcre' 'lua-carray' 'lua-digest' 'lua-compress' 'lua-cipher')
makedepends=('git' 'pkgconf')
provides=('lexiftool')
conflicts=('lexiftool')
# no submodule: vendor/exiftool is needed for the tests only
source=("$pkgname::git+https://github.com/blitzview-org/lexiftool.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # v13.64.0-3-g37a28d3 -> 13.64.0.r3.g37a28d3; before the first v* tag
    # the commit count stands in for the version: 0.r120.gabcdef0
    local described
    if described=$(git describe --long --tags --match 'v*' 2>/dev/null); then
        echo "$described" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    # lexiftool.sys and the C API as a shared library against the system's
    # Lua (the Lua modules themselves are installed as sources)
    make -C "$pkgname" sys5.5 capi-shared LUA_VERSION=5.5 LUA_PC=lua PREFIX=/usr
}

package() {
    make -C "$pkgname" install DESTDIR="$pkgdir" PREFIX=/usr LUA_VERSION=5.5 LUA_PC=lua LUA_BIN=/usr/bin/lua
    install -Dm644 "$pkgname/LICENSE" "$pkgname/LICENSE-THIRD-PARTY" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$pkgname/README.md" "$pkgname/CONTRIBUTING.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$pkgname"/doc/*.md -t "$pkgdir/usr/share/doc/$pkgname/doc/"
}
