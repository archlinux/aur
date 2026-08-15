# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: AchmadFathoni <fathoni.id@gmail.com>

pkgname=xgboost
pkgver=3.4.1
pkgrel=1
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=(gcc-libs glibc)
makedepends=(cmake cuda git nccl)
source=("$pkgname.tar.gz"::"$url/releases/download/v$pkgver/xgboost-src-$pkgver.tar.gz")
b2sums=('0d11780a4cc7286e63ee5f9ff83d81adbd2cb4b777c65e9248f94807c982d3d48e31cebf65c0a70ed2a4557de18112c3f263baf1a4ecb03d76a082b2e3eb5ad1')

prepare() {
    sed -i 's/NAMES ${NCCL_LIB_NAME}/NAMES nccl ${NCCL_LIB_NAME}/' \
        "${srcdir}/${pkgname}/cmake/modules/FindNccl.cmake"
}

build() {
    cmake \
        -B build \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_CUDA_HOST_COMPILER=$NVCC_CCBIN \
        -D CMAKE_CUDA_ARCHITECTURES="80-real;90-real;100-real;120-real;120-virtual" \
        -D USE_CUDA=ON \
        -D USE_NCCL=ON \
        -S "${srcdir}/${pkgname}"
    cmake --build build -j
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
