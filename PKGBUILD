# Maintainer: Mahdi Sarikhai <mahdisarikhani@outlook.com>
pkgname=xgboost
pkgver=2.0.1
pkgrel=2
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'cuda' 'nccl')
_dmlc_commit=ea21135fbb141ae103fb5fc960289b5601b468f2
_gputreeshap_commit=787259b412c18ab8d5f24bf2b8bd6a59ff8208f3
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dmlc/xgboost/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/dmlc/dmlc-core/archive/${_dmlc_commit}.tar.gz"
        "https://github.com/rapidsai/gputreeshap/archive/${_gputreeshap_commit}.tar.gz"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    rm -rf dmlc-core gputreeshap
    ln -sfT "${srcdir}/dmlc-core-${_dmlc_commit}" dmlc-core
    ln -sfT "${srcdir}/gputreeshap-${_gputreeshap_commit}" gputreeshap
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_CUDA=ON \
        -DUSE_NCCL=ON \
        -DCMAKE_C_COMPILER=/opt/cuda/bin/gcc \
        -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
