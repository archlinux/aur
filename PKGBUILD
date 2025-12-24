# Maintainer: crl <crl18039102576@126.com>

pkgname=cumlprims-mg
pkgver=25.12.00
pkgrel=1
pkgdesc="Multi-node, multi-GPU (MNMG) ML mathematical primitives and some algorithms used by cuML"
url="https://github.com/rapidsai/cumlprims_mg"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft')
makedepends=('cuda' 'cmake' 'gcc')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
)
sha256sums=(
    '9326eddc72e97ab3a55df2648e82cfc4e62609c2ff09602d5565c31a4180a6f5'
    'c376c0fce01468ab8621df76b2a511864296b87b822880df4d2fd5a897c29972'
)

prepare() {
    cd "$srcdir/cumlprims_mg-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
}


build() {
    cd "$srcdir/cumlprims_mg-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -G Ninja
    cmake --build build
}

package() {
    cd "$srcdir/cumlprims_mg-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

