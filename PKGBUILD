# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded-git
pkgver=1.4.1.r2.g1940568
pkgrel=1
pkgdesc='Header only library for multithreaded programming (git version)'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('git' 'cmake' 'catch2')
provides=('cs-libguarded')
conflicts=('cs-libguarded')
source=('git+https://github.com/copperspice/cs_libguarded.git'
        '020-cs-libguarded-catch2-v3-fix.patch')
sha256sums=('SKIP'
            '69088e9c0a57834695c7ec27fda5c3df8900621225a5551c37e1b5ad03e6f5e1')

prepare() {
    patch -d cs_libguarded -Np1 -i "${srcdir}/020-cs-libguarded-catch2-v3-fix.patch"
}

pkgver() {
    git -C cs_libguarded describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libguarded\.//'
}

build() {
    cmake -B build -S cs_libguarded \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 cs_libguarded/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
