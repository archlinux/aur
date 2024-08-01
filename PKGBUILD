# Maintainer: Andreas Becker <brofi.archlinux at gmail dot com>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
#
_crate='rrandr'
pkgname="$_crate-git"
pkgver=r218.05c6467
pkgrel=1
pkgdesc='A graphical interface to the RandR X Window System extension.'
arch=('x86_64')
url='https://github.com/brofi/rrandr'
license=('GPL-3.0-or-later')
depends=('gtk4' 'pango' 'cairo' 'libxcb' 'glib2' 'glibc' 'gcc-libs')
makedepends=('git' 'rust' 'cargo' 'gettext')
optdepends=('xorg-server: Xorg support')
source=('git+https://github.com/brofi/rrandr')
sha256sums=('SKIP')

prepare() {
    cd "${srcdir:?}/$_crate"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
    cd "$srcdir/$_crate"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_crate"
    CARGO_INCREMENTAL=0 cargo build --frozen --release
}

check() {
    cd "$srcdir/$_crate"
    CARGO_INCREMENTAL=0 cargo test --frozen --release
}

package() {
    cd "$srcdir/$_crate"
    install -Dm755 "target/release/$_crate" -t "${pkgdir:?}/usr/bin"
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_crate"
    install -Dm644 "$_crate/src/res/$_crate.svg" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$_crate/src/res/$_crate.desktop" -t "$pkgdir/usr/share/applications"
    mapfile -t linguas < rrandr/po/LINGUAS
    for lang in "${linguas[@]}"; do
        install -Dm644 "target/po/$lang/LC_MESSAGES/$_crate.mo" -t \
            "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    done
}

