# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.37.1
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=(any)
url=https://github.com/Calysto/octave_kernel
license=(BSD-3-Clause)
depends=(
    jupyter-metakernel
    octave
    python-ipykernel
    python-jupyter_client
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
b2sums=('4ccbb62b8e23f1bf4309e86a6e8b07dc706669511e97cd2ed1e5bbad40ab9d3a124e8c79a7c28f2e98b62bd0660ccb301d060311d0bec09e750a0cac0ae16d77')

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
