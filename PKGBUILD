# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal-git
pkgver=1.3.2.r0.g1ac656d
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'catch2' 'cs-libguarded')
provides=('cs-signal')
conflicts=('cs-signal')
source=('git+https://github.com/copperspice/cs_signal.git'
        '010-cs-signal-catch2-v3-fix.patch')
sha256sums=('SKIP'
            'e9b67a326ac0f8e37d08f83cbc8e7af107ce2bf40615692294b57eb26a3577ae')

prepare() {
    patch -d cs_signal -Np1 -i "${srcdir}/010-cs-signal-catch2-v3-fix.patch"
}

pkgver() {
    git -C cs_signal describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^signal\.//;s/^v//'
}

build() {
    cmake -B build -S cs_signal \
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
    install -D -m644 cs_signal/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
