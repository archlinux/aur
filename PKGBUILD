# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn
_pkgname=OpenNN
pkgver=26.0.1
pkgrel=4
pkgdesc="OpenNN neural network library with attention and deep learning support"
arch=('x86_64')
url="https://www.opennn.net/"
license=('AGPL-3.0-only')
depends=(
    'gcc-libs'
    'openmp'
)
makedepends=(
    'git'
    'cmake'
    'eigen'
    'ninja'
    'tinyxml2'
)
optdepends=(
    'cuda: CUDA acceleration support'
    'cudnn: cuDNN acceleration support'
)

source=(
    "https://github.com/Artelnics/opennn/archive/refs/tags/v26.0.1.tar.gz"
)

sha256sums=('457b383009b202dde4f4d25dccc840e2d0e26955b25ea345528f99b8df6ad250')

build() {
    # Tests are currently turned off, until upstream fixes wrong test assertions
    cmake -S "$pkgname-$pkgver" -B "$pkgname-$pkgver/build" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOpenNN_BUILD_SHARED=ON \
        -DOpenNN_BUILD_TESTS=OFF \
        -DOpenNN_BUILD_EXAMPLES=OFF

    cmake --build "$pkgname-$pkgver/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver/build"

    install -Dm644 \
        "$pkgname-$pkgver/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
