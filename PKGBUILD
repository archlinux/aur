# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-string-git
pkgver=1.4.0.r0.gfde6148
pkgrel=1
pkgdesc='Standalone library for unicode aware string support (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('git' 'cmake' 'catch2')
provides=('cs-string')
conflicts=('cs-string')
source=('git+https://github.com/copperspice/cs_string.git')
sha256sums=('SKIP')

pkgver() {
    git -C cs_string describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^string\.//;s/^v//'
}

build() {
    cmake -B build -S cs_string \
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
    install -D -m644 cs_string/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
