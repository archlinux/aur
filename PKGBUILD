# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libndi-git
pkgver=r19.gc14b40c
pkgrel=1
pkgdesc='Library to interact with Network Device Interface (NDI) streams (git version)'
arch=('x86_64')
url='https://code.videolan.org/jbk/libndi/'
license=('LGPL-2.1-or-later')
depends=(
    'glibc'
    'ffmpeg'
    'libmicrodns')
makedepends=(
    'git'
    'meson')
provides=('libndi')
conflicts=('libndi')
source=('git+https://code.videolan.org/jbk/libndi.git'
        '010-libndi-update-ffmpeg-api.patch')
sha256sums=('SKIP'
            'cec117da6c8d0e643db1378d88982b59c002eb2dd588ea406aea9275247686e4')

prepare() {
    patch -d libndi -Np1 -i "${srcdir}/010-libndi-update-ffmpeg-api.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C libndi rev-list --count HEAD)" "$(git -C libndi rev-parse --short HEAD)"
}

build() {
    arch-meson build libndi
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
