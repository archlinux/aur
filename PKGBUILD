# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=highway-git
pkgver=1.3.0.r146.g52a2d98d
pkgrel=1
pkgdesc='A C++ library that provides portable SIMD/vector intrinsics (git version)'
arch=('x86_64')
url='https://github.com/google/highway/'
license=('Apache-2.0 OR BSD-3-Clause')
depends=(
    'gcc-libs'
    'glibc'
    'gtest')
makedepends=(
    'cmake'
    'git')
provides=('highway')
conflicts=('highway')
source=('git+https://github.com/google/highway.git')
sha256sums=('SKIP')

pkgver() {
    git -C highway describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S highway \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DHWY_SYSTEM_GTEST:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 highway/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
