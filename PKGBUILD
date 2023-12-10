# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=3.3.0
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=('BSD-3-Clause')
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99876de94a04d0b9cdee81d4f29659bde1426b416926aef4d9a3a3a7869511a3')

prepare() {
    cd cutlass-$pkgver

    # https://github.com/NVIDIA/cutlass/issues/1248
    # delete last two lines (comment and bad add_library(...)
    head -n -2 cmake/NvidiaCutlassConfig.cmake > cmake/NvidiaCutlassConfig.cmake
}

build() {
    # this should not actually build anything, we want to install just the headers
    cmake -S cutlass-$pkgver -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCUTLASS_ENABLE_HEADERS_ONLY=ON \
        -DCUTLASS_INSTALL_TESTS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 cutlass-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -rfv "$pkgdir"/usr/test
}
