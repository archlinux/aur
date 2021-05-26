# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist-git
pkgver=0.2.0.r0.g8f13980
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications (git version)'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('git' 'meson' 'cmake' 'cmocka' 'lz4')
provides=('librist')
conflicts=('librist')
BUILDENV=('!check')
source=('git+https://code.videolan.org/rist/librist.git'
        '010-librist-gcc11-fix.patch')
sha256sums=('SKIP'
            '462003e930c8d83d0c43e92bbb3b65a013dbb56e8642d894ebd22e962e8cc94b')

pkgver() {
    git -C librist describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.\(RC\|rc\)/rc/'
}

prepare() {
    patch -d librist -Np1 -i "${srcdir}/010-librist-gcc11-fix.patch"
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
