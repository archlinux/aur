# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=pauli-prop
pkgname=python-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="Rust-accelerated Python interface for performing Pauli propagation"
arch=(x86_64)
url="https://github.com/Qiskit/pauli-prop"
license=(Apache-2.0)
depends=(
    python-numpy
    python-qiskit
    python-qiskit-aer
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
optdepends=(
    'jupyterlab-widgets: notebook dependencies'
    'python-matplotlib: notebook dependencies'
    'python-pylatexenc: notebook dependencies'
    'python-qiskit-ibm-runtime: notebook dependencies'
    'python-rustworkx: notebook dependencies'
)
checkdepends=(
    python-pytest
    python-qiskit-addon-utils
)
source=($_pkgname::git+https://github.com/Qiskit/$_pkgname.git#tag=$pkgver)
b2sums=('6f0a94816a1a00fdb5533e9981d6a43d8efa6c77ca772bac70d1b20a57d716db4e2fdc8cb7e29559a039045ebc87e9eeb45a4c53c2c07859834cf321b5d2ecfd')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" -v test
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
