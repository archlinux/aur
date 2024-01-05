# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded
pkgver=1.4.1
pkgrel=2
pkgdesc='Header only library for multithreaded programming'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('cmake' 'catch2')
source=("https://github.com/copperspice/cs_libguarded/archive/libguarded-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-cs-libguarded-gcc13-fix.patch'
        '020-cs-libguarded-catch2-v3-fix.patch')
sha256sums=('e91235d4f5e5edb4a479fccfcd1bdc2a411dd3e3344f5c973ce5870edbab13b0'
            'ddf09d574edc104deeffe884b3e420cef120f72eae8d447109a5f9192d589a13'
            '69088e9c0a57834695c7ec27fda5c3df8900621225a5551c37e1b5ad03e6f5e1')

prepare() {
    patch -d "cs_libguarded-libguarded-${pkgver}" -Np1 -i "${srcdir}/010-cs-libguarded-gcc13-fix.patch"
    patch -d "cs_libguarded-libguarded-${pkgver}" -Np1 -i "${srcdir}/020-cs-libguarded-catch2-v3-fix.patch"
}

build() {
    cmake -B build -S "cs_libguarded-libguarded-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "cs_libguarded-libguarded-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
