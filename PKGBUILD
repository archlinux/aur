# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: AchmadFathoni <fathoni.id@gmail.com>

pkgname=xgboost
pkgver=3.4.2
pkgrel=1
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=(gcc-libs glibc)
makedepends=(cmake cuda git nccl)
source=("$pkgname.tar.gz"::"$url/releases/download/v$pkgver/xgboost-src-$pkgver.tar.gz")
b2sums=('13de955f2559b16f9c877b8a1405e1e5daebd2e74e0653e542b48bc601a16f86d5a005bdc49eea04340022e85b4e96ca4407d18b435bc92d145585e3fe7c4e4f')

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
