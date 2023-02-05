# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal-git
pkgver=1.3.0.r0.g727df0a
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'catch2' 'cs-libguarded')
provides=('cs-signal')
conflicts=('cs-signal')
source=('git+https://github.com/copperspice/cs_signal.git')
sha256sums=('SKIP')

pkgver() {
    git -C cs_signal describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^signal\.//;s/^v//'
}

build() {
    cmake -B build -S cs_signal \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 cs_signal/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
