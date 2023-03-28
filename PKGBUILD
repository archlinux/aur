# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-ml-dtypes'
_pkgname=${pkgname#python-}
pkgver=0.0.4
pkgrel=4
pkgdesc='A stand-alone implementation of several NumPy dtype extensions used in ML.'
arch=('any')
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
sha256sums=('b9b09f4c674c7dc7f5074240e9123d31f30cf6572929f566082a5e2ab0a43279'
            'SKIP')

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
