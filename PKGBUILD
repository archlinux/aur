# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ibm-quantum-schemas
pkgname=python-${_pkgname}
pkgver=0.6.20260414
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
b2sums=('5466f2bcd68c68babcf644c50a57f0d9413fade98e7c3f9618dcf0348e141b8c623e09c6f342830f94f7acab2dbb88e4ad2d135085127566de8abd983c089de0')

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
