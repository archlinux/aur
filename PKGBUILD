# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.6.r41.g8c604c4
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
            'a9dc0c1a3690fea576252e687123ec2d7dfaec7c1a8b0e02c8518bdcb8e9b954')

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
