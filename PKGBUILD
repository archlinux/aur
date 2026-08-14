# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.20.r0.g4f45ef8
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
    'mbedtls3')
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
            'ce3c9e6065c13287ec55168a16722969b8741eb312972b5f574907671a86d858')

prepare() {
    patch -d librist -Np1 -i "${srcdir}/010-librist-disable-multicast-tests.patch"
}

pkgver() {
    git -C librist describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)/rc/'
}

build() {
    export CFLAGS+=' -isystem/usr/include/mbedtls3'
    arch-meson build librist --cmake-prefix-path='/usr/lib/mbedtls3/cmake'
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 librist/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
