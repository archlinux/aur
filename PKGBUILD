# Maintainer: crl <crl18039102576@126.com>

pkgname=cucollections-git
pkgver=r1546.64f57e4
pkgrel=1
pkgdesc="cuCollections (cuco) is an open-source, header-only library of GPU-accelerated, concurrent data structures."
url="https://github.com/NVIDIA/cuCollections"
arch=('any')
conflicts=('cucollections')
provides=('cucollections')
license=('Apache-2.0')
depends=('cuda' 'cmake')
source=(
    "git+$url.git" 
    "cuco.patch"
)
sha256sums=(
    'SKIP'
    'fd1beafd00132c5e6b8cee8de928e157b1103c1ab1dcfe6c0f588b29a39a4168'
)

pkgver() {
    cd "$srcdir/cuCollections"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/cuCollections"
    git apply "$srcdir/cuco.patch"
}


build() {
    cd "$srcdir/cuCollections"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DBUILD_TESTS=OFF \
        -DBUILD_BENCHMARKS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DINSTALL_CUCO=ON \
        -G Ninja
    cmake --build build
}

package() {
    cd "$srcdir/cuCollections"
    DESTDIR="$pkgdir" cmake --install build
}
