# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=highway-git
pkgver=1.1.0.r5.gaa4ba087
pkgrel=1
pkgdesc='A C++ library that provides portable SIMD/vector intrinsics (git version)'
arch=('x86_64')
url='https://github.com/google/highway/'
license=('Apache-2.0' 'BSD-3-Clause')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'gtest')
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
    install -D -m644 highway/LICENSE-BSD3 -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
