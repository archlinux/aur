# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-sqd
pkgname=python-$_name
pkgver=0.14.0
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
b2sums=('f275cb10e009839e569d4ad847602e223a4d5404c07253cf86ff1c92cd8b0743d44cfbc5b186d035b9b230d5025ed128673ea4574161bfad6cde7d5804fe03b4')

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
