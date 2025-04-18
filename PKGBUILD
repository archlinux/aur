# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=3.8.0
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=(BSD-3-Clause)
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4dd85f7c0d3452c2a194902fcd0afd7de3a3f17f86f477628d5e5f416ac885a86ed1fbbf2a9959a46e60e38a93400a7ec99bad1f980b0a4be36fad0de887ec0b')

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
