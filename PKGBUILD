# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-fermions
pkgname=python-${_pkgname}
pkgver=0.2.0
pkgrel=1
epoch=1
pkgdesc="A toolkit for working with fermionic systems"
arch=(x86_64)
url=https://github.com/Qiskit/qiskit-fermions
license=(Apache-2.0)
depends=(
    python-qiskit
    python-scipy
    python-stevedore
    python-typing_extensions
)
optdepends=(
    'python-ffsim: required for ansatz gates of the circuit library'
    'python-pyomo: support for optimization modeling'
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-rust
)
checkdepends=(
    python-sybil
    python-highspy
    python-pylatexenc
    python-pytest-subtests
    python-rustworkx
)
source=($_pkgname::git+https://github.com/Qiskit/$_pkgname#tag=$pkgver)
b2sums=('1144116d7ec2ff32b7fa36aff9565f5444b318dc41fe7373c801337cae55b0e383138aad1ae1a395e13273e763ba62d93acbd2b0989acf0115f2aa5ef5d4685b')

prepare() {
    cd $_pkgname
    sed -ie 's/qiskit~=2.5.0/qiskit~=2.6.0/g' pyproject.toml
}

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" tests/python
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
