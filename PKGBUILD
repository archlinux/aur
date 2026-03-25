# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=4.4.2
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=(BSD-3-Clause)
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d542daa5a809b1dc8cca81319b9b45437ad9965aba4d6b4fbf7a6d6477f241f0b9aa94045834977dcd16924ed88cde2c2da5795affb02290cb2247de25f0ec3e')

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
