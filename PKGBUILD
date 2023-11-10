# Maintainer: Mahdi Sarikhai <mahdisarikhani@outlook.com>
pkgname=xgboost
pkgver=2.0.2
pkgrel=1
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
        "https://github.com/rapidsai/gputreeshap/archive/${_gputreeshap_commit}.tar.gz")
sha256sums=('e83a981109363cea0c71a71b2df465a5e88f1eac9ec33057767ce884c7c2e8ce'
            '09f2e87dc627c423ad2ed0ac1735e7c73d7d515de78033096e1a88491d5549f9'
            'cc0f7c1a3fd5fe1f9dcedcf959c923af4275ab6a8b1d07ea405af014ca6b371c')

prepare() {
    cd "${pkgname}-${pkgver}"
    rm -rf dmlc-core gputreeshap
    ln -sfT "${srcdir}/dmlc-core-${_dmlc_commit}" dmlc-core
    ln -sfT "${srcdir}/gputreeshap-${_gputreeshap_commit}" gputreeshap
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
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
