# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-libguarded-git
pkgver=1.1.0.r60.gfcc67e3
pkgrel=1
pkgdesc='Header only library for multithreaded programming (git version)'
arch=('any')
url='https://www.copperspice.com/'
license=('BSD')
makedepends=('git' 'cmake' 'catch2')
provides=('cs-libguarded')
conflicts=('cs-libguarded')
source=('git+https://github.com/copperspice/cs_libguarded.git')
sha256sums=('SKIP')

pkgver() {
    git -C cs_libguarded describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libguarded\.//'
}

build() {
    cmake -B build -S cs_libguarded \
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
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 cs_libguarded/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
