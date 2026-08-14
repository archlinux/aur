# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=libccittfax-git
pkgver=r114.77d7c63
pkgrel=1
pkgdesc="CCITT Group 3/4 fax codec library"
arch=('x86_64')
url="https://github.com/thinkoid/libccittfax"
license=('WTFPL')
makedepends=('git' 'meson')
provides=('libccittfax')
conflicts=('libccittfax')
# Static-only library: keep the .a (default OPTIONS strip it) and build
# without LTO -- a slim-LTO archive is unusable by non-LTO consumers.
options=('staticlibs' '!lto')
source=("libccittfax::git+https://github.com/thinkoid/libccittfax.git")
sha256sums=('SKIP')

pkgver() {
    cd libccittfax
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    arch-meson libccittfax build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 libccittfax/LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
