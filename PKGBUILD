# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib-git
pkgver=21.1.3.r0.g915cfec
pkgrel=1
pkgdesc='Intel Graphics Memory Management Library (git version)'
arch=('x86_64')
url='https://github.com/intel/gmmlib/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('intel-gmmlib' 'gmmlib-git')
conflicts=('intel-gmmlib' 'gmmlib-git')
replaces=('gmmlib-git')
options=('!emptydirs')
source=('git+https://github.com/intel/gmmlib.git')
sha256sums=('SKIP')

pkgver() {
    git -C gmmlib describe --long --tags | sed 's/^intel-gmmlib-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S gmmlib \
        -DBUILD_TYPE='None' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DRUN_TEST_SUITE:BOOL='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 gmmlib/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
