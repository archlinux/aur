# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn-git
_pkgname=OpenNN
pkgver=0
pkgrel=2
pkgdesc="OpenNN neural network library with attention and deep learning support (Git Version)"
arch=('x86_64')
url="https://www.opennn.net/"
license=('GPL')
conflicts=('opennn')
depends=(
    'gcc-libs'
    'libgomp'
    'eigen'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'tinyxml2'
)
optdepends=(
    'cuda: CUDA acceleration support'
    'cudnn: cuDNN acceleration support'
)

source=(
    "git+https://github.com/arkadesOrg/opennn.git#branch=install-shared-library" # temporary fork branch
    # "git+https://github.com/Artelnics/opennn.git"
)

sha256sums=('SKIP')

pkgver() {
    cd opennn

    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S opennn -B opennn/build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOpenNN_SHARED_LIBS=ON \
        -DOpenNN_FORCE_WHOLE_ARCHIVE=OFF \
        -DOpenNN_BUILD_TESTS=ON \
        -DOpenNN_BUILD_EXAMPLES=OFF \
        -DOpenNN_BUILD_BLANK=ON

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
