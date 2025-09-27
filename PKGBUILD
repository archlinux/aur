# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=4.2.1
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=(BSD-3-Clause)
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b7691615acc0743f0bab6b916aece5bfafad4af40a0f6e7b736821c1689d021945e2fed2b280032324fe5902700f8bab1b4a5251842d709cba9aeb632305abf3')

build() {
    local cmake_options=(
        -B build
        -S cutlass-$pkgver
        -G Ninja
        -W no-dev
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr
        # this should not actually build anything, we want to install just the headers
        -DCUTLASS_ENABLE_HEADERS_ONLY=ON
        -DCUTLASS_INSTALL_TESTS=OFF
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -vDm 644 cutlass-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
    rm -rfv "$pkgdir"/usr/test
}
