# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal
pkgver=1.3.2
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
depends=('gcc-libs')
makedepends=('cmake' 'catch2' 'cs-libguarded')
source=("https://github.com/copperspice/cs_signal/archive/signal-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-cs-signal-catch2-v3-fix.patch')
sha256sums=('24fc3adf06169eb2a195d62811eecda6268a78d489dab596c405e1a7d3cde9d8'
            'e9b67a326ac0f8e37d08f83cbc8e7af107ce2bf40615692294b57eb26a3577ae')

prepare() {
    patch -d "cs_signal-signal-${pkgver}" -Np1 -i "${srcdir}/010-cs-signal-catch2-v3-fix.patch"
}

build() {
    cmake -B build -S "cs_signal-signal-${pkgver}" \
        -G 'Unix Makefiles' \
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
    install -D -m644 "cs_signal-signal-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
