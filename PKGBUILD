# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=run0-sudo
pkgver=1.0.0
pkgrel=1
pkgdesc="A tiny sudo-compatibility shim backed by run0"
arch=('x86_64')
url="https://codeberg.org/nathawat/run0-sudo-shim"
license=('GPL-3.0-or-later')
depends=('systemd>=256.0')
makedepends=('zig')
provides=('sudo')
conflicts=('sudo')
_repo=run0-sudo-shim
_tag="v${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/nathawat/${_repo}/archive/${_tag}.tar.gz"
)
b2sums=('8260236446707f08e0d6f91afab0442aa9e6d832504d730bd2525bae4d093dd55429e640faeb4ba2a385e16eac2d4634e0e9f8ce7c1c0341032d19aa27dfe054')

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

    install -Dm755 "zig-out/bin/run0-sudo" "$pkgdir/usr/bin/sudo"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
