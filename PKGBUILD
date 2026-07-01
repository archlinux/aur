# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=1.1.0
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
    python-rpds-py
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
b2sums=('74fccbb8cb618caa1f3e57f0c46af051e3dc70f1dad291b4b99e0f9ed15c45f8f16625618c81a32fad616609b3d9ea005fcaa87cc460d96a8648187eec3a26df')

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
