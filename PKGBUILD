# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=1.0.1
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=(any)
url=https://github.com/Calysto/octave_kernel
license=(BSD-3-Clause)
depends=(
    jupyter-metakernel
    octave
    python-ipykernel
    python-jupyter-client
)
makedepends=(
    python-build
    python-hatchling
    python-installer
)
checkdepends=(python-pytest)
optdepends=(
    'gnuplot: for making plots'
    'jupyterlab: JupyterLab computational environment'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/Calysto/octave_kernel/archive/v$pkgver.tar.gz)
b2sums=('7eb02b207c5b339893022a5a4ac997c3bd761056381b3011f4337a6091782dc5153e8b3c1606c649c97177b5458bd9c4659e439223f1ed854ddd6b921e68f271')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf $_name
    test-env/bin/python -P -m pytest -o addopts="" tests
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
