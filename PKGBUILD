# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ibm-quantum-schemas
pkgname=python-${_pkgname}
pkgver=0.8.20260605
pkgrel=1
pkgdesc="IBM Quantum API Schemas"
arch=(any)
url=https://github.com/Qiskit/ibm-quantum-schemas
license=(Apache-2.0)
depends=(
    python-pybase64
    python-pydantic
    python-qiskit
    python-samplomatic
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
)
checkdepends=(python-pytest)
source=($_pkgname::git+https://github.com/Qiskit/$_pkgname.git#tag=$pkgver)
b2sums=('ce8bd5daa689e74b5ca690e2812427a867746f46d15fbe96f92248c5f3355740bf20c1dc045370d8fec26ca27c1ce0db504cb036f5003226f88f86252c7bb919')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf ${_pkgname//-/_}
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
