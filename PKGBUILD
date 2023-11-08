# Maintainer: Mahdi Sarikhai <mahdisarikhani@outlook.com>
pkgname=xgboost
pkgver=2.0.1
pkgrel=1
pkgdesc="An optimized distributed gradient boosting library"
arch=('x86_64')
url="https://github.com/dmlc/xgboost"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'cuda' 'git' 'nccl')
source=("git+https://github.com/dmlc/xgboost.git#tag=v${pkgver}"
        "git+https://github.com/dmlc/dmlc-core.git"
        "git+https://github.com/rapidsai/gputreeshap.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${pkgname}"
    git submodule init
    git config submodule.dmlc-core.url "${srcdir}/dmlc-core"
    git config submodule.gputreeshap.url "${srcdir}/gputreeshap"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "${pkgname}" \
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
