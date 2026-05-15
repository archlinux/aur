# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=rg-grep
pkgver=1.0.0
pkgrel=1
pkgdesc="A tiny grep-compatibility shim backed by ripgrep"
arch=('x86_64')
url="https://codeberg.org/nathawat/rg-grep-shim"
license=('GPL-3.0-or-later')
depends=('ripgrep')
makedepends=('zig')
provides=('grep')
conflicts=('grep')
_repo=rg-grep-shim
_tag="v${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/nathawat/${_repo}/archive/${_tag}.tar.gz"
)
b2sums=('ea6b0ae1c9d4871545c770616525ff7ddbdd452455a4f9527a95815a2f53c0b2e22cc464b83c85549ef9041724aa62d93ede221400e7d8fb15b9ef5b4bbfd40f')

_resolve_srcdir() {
    local d
    for d in "$srcdir/${_repo}"*; do
        [[ -d "$d" ]] || continue
        printf '%s\n' "$d"
        return 0
    done
    return 1
}

_enter_srcdir() {
    local d
    d="$(_resolve_srcdir)" || {
        printf 'error: unable to locate extracted source directory for %s in %s\n' "$_repo" "$srcdir" >&2
        return 1
    }
    cd "$d"
}

prepare() {
    _enter_srcdir
}

build() {
    _enter_srcdir
    zig build --release=fast
}

check() {
    _enter_srcdir
    zig build test
}

package() {
    _enter_srcdir

    install -Dm755 "zig-out/bin/rg-grep" "$pkgdir/usr/bin/grep"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
