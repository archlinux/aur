# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-intel-driver-git
pkgver=2.4.1.r6.gab755cb7
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family (git version)'
arch=('x86_64')
url='https://01.org/linuxmedia/vaapi/'
license=('MIT')
depends=('libdrm' 'libva-git')
makedepends=('git' 'meson')
provides=('libva-intel-driver')
conflicts=('libva-intel-driver')
replaces=('libva-driver-intel')
source=('git+https://github.com/intel/intel-vaapi-driver.git')
sha256sums=('SKIP')

prepare() {
    # Only relevant if intel-gpu-tools is installed,
    # since then the shaders will be recompiled
    sed -i '1s/python$/&2/' intel-vaapi-driver/src/shaders/gpp.py
}

pkgver() {
    local _version
    _version="$(git -C intel-vaapi-driver tag --list --sort='-v:refname' | grep -E '^[0-9]+\.[0-9]+(\.[0-9]+)*$' | sort -rV | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C intel-vaapi-driver rev-list --count "${_version}..HEAD")" \
                        "$(git -C intel-vaapi-driver rev-parse --short HEAD)"
}

build() {
    arch-meson intel-vaapi-driver build
    ninja -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 intel-vaapi-driver/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
