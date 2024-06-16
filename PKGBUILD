# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr-git
pkgver=1.0.0.r164.g56b3e49
pkgrel=1
pkgdesc='Codec for the Ultra HDR format (git version)'
arch=('x86_64')
url='https://github.com/google/libultrahdr/'
license=('Apache-2.0')
depends=('gcc-libs' 'libjpeg')
makedepends=('git' 'cmake')
provides=('libultrahdr')
conflicts=('libultrahdr')
source=('git+https://github.com/google/libultrahdr.git'
        '010-libultrahdr-fix-bool-type.patch'::'https://github.com/google/libultrahdr/commit/a02750532d9b50436f8fdae0c1fdd08fa516766e.patch')
sha256sums=('SKIP'
            '4347dbc59999629381e9b3df1ff35a875433b90ef7e188bfec519b664486b2f2')

prepare() {
    # https://github.com/google/libultrahdr/pull/174
    patch -d libultrahdr -Np1 -i "${srcdir}/010-libultrahdr-fix-bool-type.patch"
}

pkgver() {
    git -C libultrahdr describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libultrahdr \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DUHDR_BUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 build/ultrahdr_app -t "${pkgdir}/usr/bin"
}
