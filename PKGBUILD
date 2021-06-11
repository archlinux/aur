# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.1.r0.g567431a
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
            '60004953f606bb96418be5dcc6bae2fa0883ce83c4f2246f33a2eda8c9c5a56b')

prepare() {
    patch -d librist -Np1 -i "${srcdir}/010-librist-disable-multicast-tests.patch"
}

pkgver() {
    git -C librist describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)/rc/'
}

build() {
    arch-meson build librist
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
    install -D -m644 librist/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
