# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn
_pkgname=OpenNN
pkgver=8.0.0
pkgrel=1
pkgdesc="OpenNN neural network library with attention and deep learning support"
arch=('x86_64')
url="https://www.opennn.net/"
license=('GPL')
depends=(
    'gcc-libs'
    'openmp'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
)
optdepends=(
    'cuda: CUDA acceleration support'
    'cudnn: cuDNN acceleration support'
)

source=(
    "https://github.com/Artelnics/opennn/archive/refs/tags/v8.0.0.tar.gz"
    "cuda-definition.patch"
)

sha256sums=(
    '3f2326b4a85cc2c388baf00107a340ee91104ef5b8d7fa83b6add555e7d9ea90'
    'c2c7766d227e7510cef1eb2b250c03819553410c1920c60fd65752fe20539941'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -Np1 -i "$srcdir/cuda-definition.patch"
}

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOpenNN_BUILD_TESTS=OFF \
        -DOpenNN_BUILD_EXAMPLES=OFF \
        -DOpenNN_BUILD_BLANK=OFF

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 \
        "$pkgname-$pkgver/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
