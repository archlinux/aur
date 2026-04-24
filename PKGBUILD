# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ibm-quantum-schemas
pkgname=python-${_pkgname}
pkgver=0.7.20260419
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
b2sums=('cad928ee655bdaa2597ca2ac6875db32b6c9c8ef819b9a3915f1c9155f5595626a0b68b2a00374ac7fa23205a11fa2df5f4c6c6baa17330b9ac15a0d37c9469f')

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
