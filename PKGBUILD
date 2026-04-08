# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=1.0.3
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
b2sums=('0f09025e2dfeeab12124d440b739d4a6068f923d92b1f423f40747bdd1e6371444e45adcccf2c162b4e54d92d3e3606bf923c72d86503b7b00da6f29f0bf07f3')

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
