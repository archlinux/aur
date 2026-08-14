# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=libfaxtiff-git
pkgver=r40.914a96a
pkgrel=1
pkgdesc="CCITT Group 3/4 fax codec extracted from libtiff"
arch=('x86_64')
url="https://github.com/thinkoid/libfaxtiff"
license=('libtiff')
makedepends=('git' 'meson')
provides=('libfaxtiff')
conflicts=('libfaxtiff')
# Static-only library: keep the .a (default OPTIONS strip it) and build
# without LTO -- a slim-LTO archive is unusable by non-LTO consumers.
options=('staticlibs' '!lto')
source=("libfaxtiff::git+https://github.com/thinkoid/libfaxtiff.git")
sha256sums=('SKIP')

pkgver() {
    cd libfaxtiff
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    arch-meson libfaxtiff build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 libfaxtiff/LICENSE.md \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
