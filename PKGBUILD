# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: AchmadFathoni <fathoni.id@gmail.com>

pkgname=xgboost
pkgver=3.4.0
pkgrel=1
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=(gcc-libs glibc)
makedepends=(cmake cuda git nccl)
source=("$pkgname.tar.gz"::"$url/releases/download/v$pkgver/xgboost-src-$pkgver.tar.gz")
b2sums=('6c8707b8e1f7dd6bb846ac1ba4996008c3e92abf62d12180123534b2b70f12b7e11b306e966958a6dc4f152b3fb60beaf026905f99e40078c39ff9fb18c3ee92')

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
