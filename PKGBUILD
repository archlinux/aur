# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=4.0.0
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=(BSD-3-Clause)
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b68e729c70281279de2c621b09b5c81e8bc0f54afe9293b823e16c746d420ff68286264e9bd7f3c024e15059aeb674cda84d6a4c2e5166e031c3a6bc03c13f10')

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
