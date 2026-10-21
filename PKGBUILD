# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-opt-mapper
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="Mapping combinatorial optimization problems to quantum computers"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-opt-mapper
license=(Apache-2.0)
depends=(
    python-cvxpy
    python-docplex
    python-networkx
    python-numpy
    python-qiskit
    python-rustworkx
    python-scipy
)
makedepends=(
    git
    python-build
    python-installer
    python-hatchling
)
checkdepends=(
    python-ddt
    python-pytest
    python-pytest-subtests
)
source=($_name::git+https://github.com/Qiskit/$_name.git#tag=$pkgver)
b2sums=('2aed23e47dbcab281543137d0cafce89a5e3e6a5a910635afcfdd68cd84f6bf730a21b2e1e12f2993d4df70e98f82bb594b25063d7fa5dc148f90013c9f1c948')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf ${_name//-/_}
    test-env/bin/python -P -m pytest -o addopts="" test
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
