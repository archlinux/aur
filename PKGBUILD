# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=samplomatic
pkgname=python-${_name}
pkgver=0.18.0
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
b2sums=('d16737343fe917a35f06795ef48d6ceda82fbe487e570e1e6165e014184f9363a5a5923721f0285d0ad080d4576de27d7a1778793474fa8f41b9a3b6adbf99e8')

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
