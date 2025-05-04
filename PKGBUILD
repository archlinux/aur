# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=cutlass-headers
pkgver=3.9.2
pkgrel=1
pkgdesc="CUDA Templates for Linear Algebra Subroutines (headers only)"
arch=(x86_64)
url="https://github.com/NVIDIA/cutlass"
license=(BSD-3-Clause)
depends=(cuda)
makedepends=(cmake ninja)
conflicts=(cutlass)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('04462b3c6983f96b2027821408c4de30bf6b2e18e986ddebaf4f9d5572df354273116603ccc0ac618c61e03b981972e6d7786f354aa4f5e08d185cf7e4ad8e1d')

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
