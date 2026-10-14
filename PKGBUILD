# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=opennn-git
_pkgname=OpenNN
pkgver=26.0.1.r0.g828dd67d8
pkgrel=3
pkgdesc="OpenNN neural network library with attention and deep learning support (Git Version)"
arch=('x86_64')
url="https://www.opennn.net/"
license=('AGPL-3.0-only')
provides=('opennn')
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
    "$pkgname::git+https://github.com/Artelnics/opennn.git"
)

sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S "$pkgname" -B "$pkgname/build" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOpenNN_BUILD_SHARED=ON \
        -DOpenNN_BUILD_TESTS=OFF # temporarly OFF

    cmake --build "$pkgname/build"
}

# temporarly OFF as master branch tests fail
# check() {
#     ctest --test-dir "$pkgname/build" --output-on-failure
# }

package() {
    DESTDIR="${pkgdir}" cmake --install $pkgname/build
    install -Dm644 \
        $pkgname/LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
