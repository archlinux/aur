# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: AchmadFathoni <fathoni.id@gmail.com>

pkgname=xgboost
pkgver=3.0.4
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
b2sums=('5cacc0482e3a39a30c76bc72ed6b2f889b8dad509acf4c562d989e695dcd739206cfc027672e884957810bf4472619193db5728b0c11288ccbcdeec89b9c107c'
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
