# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-catboost-gpu-git
pkgver=0.12.2
pkgrel=5
epoch=0
pkgdesc="CatBoost is an open-source gradient boosting on decision trees library with categorical features support out of the box."
arch=('i686' 'x86_64')
url="https://catboost.yandex"
license=('Apache-2.0')
depends=('python-six' 'python-numpy' 'cuda')
makedepends=()
checkdepends=()
optdepends=('python-pandas' 'python-ipywidgets')
provides=()
conflicts=()
replaces=()
backup=()
options=()

source=('catboost::git+https://github.com/catboost/catboost.git')
md5sums=('SKIP')

validpgpkeys=()

pkgver() {
    cd "$srcdir/catboost"
    printf "$(git describe | sed -E 's/^v([0-9]+.[0-9]+.[0-9]+).*$/\1/')"
}

build() {
    export YA_CACHE_DIR=/tmp/.ya

    cd "$srcdir/catboost/catboost/python-package/catboost"
    ../../../ya make -r \
        -DNO_DEBUGINFO \
        -DUSE_ARCADIA_PYTHON=no \
        -DOS_SDK=local \
        -DPYTHON_CONFIG=python3-config \
        -DHAVE_CUDA=yes \
        -DCUDA_ROOT=/opt/cuda

    cd "$srcdir/catboost/catboost/python-package"
    python3 mk_wheel.py -DCUDA_ROOT=/opt/cuda
}

package() {
    cd "$srcdir/catboost/catboost/python-package"
    pip3 install --no-deps --prefix $pkgdir/usr catboost-*.whl
}
