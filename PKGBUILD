# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: AchmadFathoni <fathoni.id@gmail.com>

pkgname=xgboost
pkgver=3.0.2
pkgrel=1
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=(gcc-libs glibc)
makedepends=(cmake cuda git nccl)
#"git+$url#tag=v${pkgver}"
source=("$pkgname.tar.gz"::"$url/releases/download/v$pkgver/xgboost-src-$pkgver.tar.gz"
        "quantile.patch")
b2sums=('c6ad3ccc7b8d1b838c9258bd6df17307ceea84fd1a98495817c9d7af06bbe3fe09fae382765853b29ae80db6693afc7eb71e581114af810d2eff719f468a30f5'
        '715904014923edefd2824abb05462578be80f50c5ea76eca2b21f8403d345045917feb837aa67ab7014f07172a48b58e1a7d7f3d63d3f563ceb7dc0125d7a89d')

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
    # https://github.com/dmlc/xgboost/pull/10797
    git apply "${srcdir}/quantile.patch"
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
