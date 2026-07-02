# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn
_pkgname=OpenNN
pkgver=8.0.1
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
    "https://github.com/Artelnics/opennn/archive/refs/tags/v8.0.1.tar.gz"
)

sha256sums=('858a3cbfb598d95dd9ad8b7ff7a525ab97975934fb693beacb533d22064dd678')


build() {
    cmake -S opennn -B opennn/build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOpenNN_BUILD_TESTS=ON \
        -DOpenNN_BUILD_EXAMPLES=OFF \
        -DOpenNN_BUILD_BLANK=OFF

    cmake --build opennn/build
}

check() {
    cd ./opennn/build
    ./bin/run_tests
}

package() {
    DESTDIR="${pkgdir}" cmake --install opennn/build

    install -Dm644 \
        opennn/LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
