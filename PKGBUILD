# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cnmatrix-git
pkgver=0.0.r36.g5936c62
pkgrel=1
pkgdesc='C interface to a few matrix backends (git version)'
arch=('x86_64')
url='https://github.com/cntools/cnmatrix/'
license=('MIT')
makedepends=('git' 'cmake' 'eigen')
provides=('cnmatrix')
conflicts=('cnmatrix')
source=('git+https://github.com/cntools/cnmatrix.git')
sha256sums=('SKIP')

pkgver() {
    git -C cnmatrix describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S cnmatrix \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTS:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 cnmatrix/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
