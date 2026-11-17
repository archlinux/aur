# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=misa77
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast LZ77 codec with high decompression throughput"
arch=('x86_64' 'aarch64')
url="https://github.com/welcome-to-the-sunny-side/misa77"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
options=('!lto' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/welcome-to-the-sunny-side/misa77/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66b38f2210dbd52bd749bf92c572827fd216eff5d751cdcd9b289c33aaa18c79')

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
