# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal
pkgver=2.0.0
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'catch2'
    'cmake'
    'cs-libguarded')
source=("https://github.com/copperspice/cs_signal/archive/signal-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-cs-signal-catch2-v3-fix.patch')
sha256sums=('ddb273537962bde18d369602f5e8b3dedf88a1873e5c4a4013f6697a0c735278'
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
