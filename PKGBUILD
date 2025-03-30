# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib-git
pkgver=22.7.1.r3.g60304dc
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
source=('git+https://github.com/intel/gmmlib.git'
        '010-intel-gmmlib-cmake4-fix.patch')
sha256sums=('SKIP'
            'ca13f899e802c2488e92bbb5809c20f0f77c68940c995a5eecc8ed6abb4c9b4b')

prepare() {
    patch -d gmmlib -Np1 -i "${srcdir}/010-intel-gmmlib-cmake4-fix.patch"
}

pkgver() {
    git -C gmmlib describe --long --tags | sed 's/^intel-gmmlib-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S gmmlib \
        -G 'Unix Makefiles' \
        -DBUILD_TYPE='None' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DRUN_TEST_SUITE:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 gmmlib/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
