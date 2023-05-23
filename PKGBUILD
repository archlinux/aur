# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
_pkgname=${pkgname#python-}
pkgver=0.1.0
pkgrel=2
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML.'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://github.com/jax-ml/ml_dtypes'
license=('Apache')
groups=('jax')
depends=('python-numpy')
makedepends=(
    'eigen'
    'pybind11'
    'python-absl'
    'python-build'
    'python-installer'
    'python-pytest'
    'python-setuptools'
    'python-wheel'
)
source=("ml-dtypes-${pkgver}.tar.gz::https://github.com/jax-ml/ml_dtypes/archive/refs/tags/v${pkgver}.tar.gz"
        'ml-dtypes.diff')
sha256sums=('d95d095a558c6f7da21649059146eef7002c17a8756b097ae3f93e96e02fc37f'
            'bd51a6bd8dcf51a71314be83dc3a2cdbe56f2007472464ccde820783eb2df5f9')

prepare() {
    cd ml_dtypes-$pkgver
    patch -p0 -i ../ml-dtypes.diff
}

build() {
    cd ml_dtypes-$pkgver
    python -m build -n -w
    python setup.py build_ext -i
}

check() {
    cd ml_dtypes-$pkgver
    PYTHONPATH=$(pwd) pytest
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        ml_dtypes-$pkgver/dist/ml_dtypes-$pkgver-*-*.whl
}
