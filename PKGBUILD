# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ffsim
pkgname=python-${_pkgname}
pkgver=0.0.85
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
    python-typing_extensions
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
b2sums=('cff8c407079ed3edda238ce9a7c492bcdfbf6c7b132419f0e58ec3e5e84db6b13aadba499c90343cc585d454ca2acad014e8bc9a300a279d7bbca5545e11d620')

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
