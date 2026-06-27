# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.19rc1.r0.gf86b48b
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications (git version)'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD-2-Clause')
depends=(
    'cjson'
    'glibc'
    'libmicrohttpd'
    'lz4'
    'mbedtls')
makedepends=(
    'cmake'
    'cmocka'
    'git'
    'meson')
provides=('librist')
conflicts=('librist')
source=('git+https://code.videolan.org/rist/librist.git'
        '010-librist-disable-multicast-tests.patch')
sha256sums=('SKIP'
            'e6b3a6f0f169455ead712c71c4e088bb3ae97bc19c890eb0c81aaafe867f4282')

prepare() {
    patch -d librist -Np1 -i "${srcdir}/010-librist-disable-multicast-tests.patch"
}

pkgver() {
    git -C librist describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)/rc/'
}

build() {
    arch-meson build librist
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 librist/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
