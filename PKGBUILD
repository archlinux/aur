# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=samplomatic
pkgname=python-${_name}
pkgver=0.19.0
pkgrel=1
pkgdesc="A library that helps you sample randomizations of your quantum circuits"
arch=(any)
url=https://github.com/Qiskit/samplomatic
license=(Apache-2.0)
depends=(
    blas-openblas
    python-numpy
    python-orjson
    python-pybase64
    python-qiskit
    python-rustworkx
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
)
checkdepends=(
    jupyter-nbformat
    python-matplotlib
    python-plotly
    python-pylatexenc
    python-pytest
    python-qiskit-aer
    python-scipy-doctest
)
optdepends=(
    "jupyter-nbformat: visualization"
    "python-plotly: visualization"
    "python-matplotlib: visualization"
    "python-pylatexenc: LaTeX"
)
source=($_name::git+https://github.com/Qiskit/$_name.git#tag=$pkgver)
b2sums=('ed1af22536091dbfcb07ea778e425a4dbb40f2472eef72a84f5a446886ef57dbf59d769271a033e4101e9c898ad2b44a304846f17f472dbee43f0008fdd83c2c')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf $_name
    test-env/bin/python -P -m pytest -o addopts="" test/unit
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
