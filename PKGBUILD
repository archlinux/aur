# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=taskflow
pkgver=4.1.0
pkgrel=1
pkgdesc='Modern C++ parallel task programming library (header-only)'
arch=('any')
url='https://github.com/taskflow/taskflow'
license=('MIT')
makedepends=('cmake')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/taskflow/taskflow/archive/refs/tags/v$pkgver.tar.gz"
    'gcc-16-inclusive-scan.patch'
)
sha256sums=(
    '2107f90e315e48a676922010b036357ff2b0c6b9160ce17fa9396e5860b1d715'
    '9b699aa1feef80d2a2098728c0af63a9a7ec6145e28c1f4dc25be25d419bfce7'
)

prepare() {
    cd "$pkgname-$pkgver"

    # libstdc++ 16 moves from a mutable first input element in its no-init
    # inclusive_scan. Keep Taskflow's documented in-place path non-destructive.
    patch -Np1 -i "$srcdir/gcc-16-inclusive-scan.patch"
}

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTF_BUILD_TESTS=ON \
        -DTF_BUILD_EXAMPLES=OFF \
        -DTF_BUILD_PROFILER=OFF
    cmake --build build --parallel 2
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
