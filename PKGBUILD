# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ffsim
pkgname=python-${_pkgname}
pkgver=0.0.86
pkgrel=1
pkgdesc="Faster simulation of fermionic quantum circuits"
arch=(x86_64)
url=https://github.com/qiskit-community/ffsim
license=(Apache-2.0)
depends=(
    python-jax
    python-numpy
    python-opt_einsum
    python-orjson
    python-pyscf
    python-scipy
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
optdepends=(
    'python-qiskit: Qiskit interoperability'
)
checkdepends=(
    python-pytest
    python-qiskit
)
source=($_pkgname::git+https://github.com/qiskit-community/$_pkgname#tag=v$pkgver)
b2sums=('5cac15e565b2e8d2eac5d2f75f3e15cdd4daf3e110a4ab965efa08ff7343a82f0f2699d35801462078314549c951bc598b474b45c3b4ebc3b7807ff49809e799')

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
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
