# Maintainer: crl <crl18039102576@126.com>

pkgname=cucollections-git
pkgver=r1530.162b99e
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
    'c690f206c8f278f28474764568138a284e6372945bf60632f83ef0d9950dbb5c'
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
