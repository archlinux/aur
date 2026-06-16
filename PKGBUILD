# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn-git
_pkgname=OpenNN
pkgver=r9445.d307dc56d
pkgrel=1
pkgdesc="OpenNN neural network library with attention and deep learning support"
arch=('x86_64')
url="https://github.com/Artelnics/opennn"
license=('GPL')
depends=(
    'gcc-libs'
    'openmp'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    # 'cuda'
    # 'cudnn'
)
optdepends=(
    'cuda: CUDA acceleration support'
    'cudnn: cuDNN acceleration support'
)

source=(
    "git+https://github.com/arkadesOrg/opennn.git#branch=aur-pkgbuild"
)

sha256sums=('SKIP')

pkgver() {
    cd opennn

    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S opennn -B build \
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
        opennn/LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
