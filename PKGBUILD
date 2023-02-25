# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-utils-git
pkgver=2.17.1.r7.gffc0b0d
pkgrel=1
pkgdesc='Intel VA-API media applications and scripts for libva (git version)'
arch=('x86_64')
url='https://github.com/intel/libva-utils/'
license=('MIT')
depends=('libva')
makedepends=('git' 'meson' 'mesa')
provides=('libva-utils')
conflicts=('libva-utils')
source=('git+https://github.com/intel/libva-utils.git')
sha256sums=('SKIP')

pkgver() {
    local _version
    _version="$(git -C libva-utils tag --list --sort='-v:refname' | grep -E '^[0-9]+\.[0-9]+(\.[0-9]+)*$' | sort -rV | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C libva-utils rev-list --count "${_version}..HEAD")" \
                        "$(git -C libva-utils rev-parse --short HEAD)"
}

build() {
    arch-meson libva-utils build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 libva-utils/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
