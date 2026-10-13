# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn
_pkgname=OpenNN
pkgver=26.0.1
pkgrel=2
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
        -DOpenNN_BUILD_TESTS=OFF \
        -DOpenNN_BUILD_EXAMPLES=OFF \
        -DOpenNN_BUILD_BLANK=OFF

    cmake --build "$pkgname-$pkgver/build"
}

# Tests are currently turned off, until upstream fixes wrong test assertions
# check() {
#     cd "$pkgname-$pkgver/build"
#     ./bin/run_tests
# }

package() {
    DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver/build"

    install -Dm644 \
        "$pkgname-$pkgver/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
