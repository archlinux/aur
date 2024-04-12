# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=3.5.0
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=('BSD-3-Clause')
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a0ae902128f6f91119be68ccd186200e1926192de74e06c4b15a590bf9373b85f3d839f1cd9968c9dbdb764d278d9ab58b68595461390ac0ceb9e57ee778f140')

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
