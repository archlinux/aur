# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=misa77
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast LZ77 codec with high decompression throughput"
arch=('x86_64' 'aarch64')
url="https://github.com/welcome-to-the-sunny-side/misa77"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
options=('!lto' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/welcome-to-the-sunny-side/misa77/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8bcb31c577c54c526f2d621c071df8e597204db9947a83321c182854125f7bdc')

latestver() {
    gh api --paginate repos/welcome-to-the-sunny-side/misa77/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -n 1
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DMISA77_BUILD_TESTS=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    install -Dm755 build/misa "${pkgdir}/usr/bin/misa"
    install -Dm644 "${pkgname}-${pkgver}/include/misa77/misa77.h" \
        "${pkgdir}/usr/include/misa77/misa77.h"
    install -Dm644 "${pkgname}-${pkgver}/include/misa77/experimental.h" \
        "${pkgdir}/usr/include/misa77/experimental.h"
    install -Dm644 build/libmisa77.a "${pkgdir}/usr/lib/libmisa77.a"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
