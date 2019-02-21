# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-catboost-gpu-git
pkgver=r5141.a8f5a19bc
pkgrel=1
epoch=0
pkgdesc="CatBoost is an open-source gradient boosting on decision trees library with categorical features support out of the box."
arch=('i686' 'x86_64')
url="https://catboost.yandex"
license=('Apache-2.0')
depends=('python-six' 'python-numpy' 'cuda')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()

source=('catboost::git+https://github.com/catboost/catboost.git'
        'cuda10deprecation.patch')
md5sums=('SKIP'
         '44fc5e88fd55a6d19d45fa61cdca6b70')

validpgpkeys=()

pkgver() {
    cd "$srcdir/catboost"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export YA_CACHE_DIR=/tmp/.ya

    cd "$srcdir/catboost"
    git apply "$srcdir/catboost/cuda10deprecation.patch"

    cd "$srcdir/catboost/catboost/python-package/catboost"
    ../../../ya make -r \
        -DUSE_ARCADIA_PYTHON=no \
        -DPYTHON_CONFIG=python3-config \
        -DHAVE_CUDA=yes \
        -DCUDA_ROOT=$CUDA_ROOT
}

package() {
    cd "$srcdir/catboost/catboost/python-package"
    python3 mk_wheel.py -DCUDA_ROOT=$CUDA_ROOT
    pip3 install --prefix $pkgdir/ catboost-*.whl
}
