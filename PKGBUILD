# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: AchmadFathoni <fathoni.id@gmail.com>

pkgname=xgboost
pkgver=2.0.3
pkgrel=1
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=(gcc-libs glibc)
makedepends=(cmake cuda git nccl)
source=("$pkgname"::"git+$url#tag=v${pkgver}"
        "tuple.patch")
sha256sums=('SKIP'
            'dc7a2fa0b59a8cb8a92c4ba7d0dc923c8a439d15e9ed9510b45d1c3e0e09fb77')

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
    # https://github.com/NVIDIA/cccl/issues/1519
    git apply "${srcdir}/tuple.patch"
}

build() {
    cmake \
        -B build \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D USE_CUDA=ON \
        -D USE_NCCL=ON \
        -S "${srcdir}/${pkgname}"
    cmake --build build -j
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
