# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-catboost-gpu-git
pkgver=0.2
pkgrel=2
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

source=("catboost::git+https://github.com/catboost/catboost.git")
md5sums=('SKIP')

validpgpkeys=()

pkgver() {
    cd "$srcdir/catboost"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    export YA_CACHE_DIR=/tmp/.ya

    cd $srcdir/catboost/catboost/python-package/catboost
    ../../../ya make -r -DUSE_ARCADIA_PYTHON=no -DUSE_SYSTEM_PYTHON=3.7 -DPYTHON_CONFIG=python3-config -DCUDA_ROOT=$CUDA_ROOT

    cd ..
    python3 mk_wheel.py -DCUDA_ROOT=$CUDA_ROOT
    pip3 install --prefix $pkgdir/ catboost-*.whl
}
