# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr-git
pkgver=1.4.0.r22.g1acdbed
pkgrel=1
pkgdesc='Codec for the Ultra HDR format (git version)'
arch=('x86_64')
url='https://github.com/google/libultrahdr/'
license=('Apache-2.0')
depends=(
    'glibc'
    'libgcc'
    'libjpeg-turbo'
    'libstdc++')
makedepends=(
    'cmake'
    'git')
provides=('libultrahdr')
conflicts=('libultrahdr')
source=('git+https://github.com/google/libultrahdr.git')
sha256sums=('SKIP')

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
