# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.10.r0.g1e80550
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications (git version)'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('git' 'meson' 'cmake' 'cmocka' 'lz4')
provides=('librist')
conflicts=('librist')
source=('git+https://code.videolan.org/rist/librist.git'
        '010-librist-disable-multicast-tests.patch')
sha256sums=('SKIP'
            '0b8363a832a0e20ee756936efde714acaa3dfa74cffa1ef8283f3373663d0e35')

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
