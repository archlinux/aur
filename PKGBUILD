# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-sqd
pkgname=python-$_name
pkgver=0.14.1
pkgrel=1
pkgdesc="Sample-based Quantum Diagonalization"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-sqd
license=(Apache-2.0)
depends=(
    python-jax
    python-jaxlib
    python-numpy
    python-pyscf
    python-qiskit
    python-scipy
)
makedepends=(
    git
    python-build
    python-installer
    python-hatchling
)
# optdepends=(
#     'python-fulqrum'
#     'python-primme'
#     'python-sbd-eigensolver'
# )
checkdepends=(python-pytest)
source=($_name::git+https://github.com/Qiskit/$_name.git#tag=$pkgver)
b2sums=('a2b038a0e406db1064d04a5486ba4a54eacdfed3bacbc4f791b68671c85a327ce3f3c11939cc494f3fdcf095503a591bb725ebf367d8c94255838238e9ebb113')

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
