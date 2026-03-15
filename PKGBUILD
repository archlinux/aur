# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=pyzx
pkgname=python-$_name
pkgver=0.10.0
pkgrel=1
pkgdesc="A library for quantum circuit rewriting and optimisation using the ZX-calculus"
arch=(any)
url=https://github.com/zxcalc/pyzx
license=(Apache-2.0)
depends=(
    python-galois
    python-ipywidgets
    python-lark-parser
    python-numpy
    python-pyperclip
    python-tqdm
    python-typing_extensions
)
makedepends=(
    python-build
    python-installer
    python-setuptools
)
checkdepends=(
    python-qiskit
    python-qiskit-qasm3-import
    python-quimb
)
optdepends=(
    "python-matplotlib: plotting support"
    "python-qiskit: Qiskit support"
    "python-qiskit-qasm3-import: OpenQASM3 support"
    "python-quimb: tensor networks support"
)
source=($_name-$pkgver.tar.gz::https://github.com/zxcalc/pyzx/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('97eea90849999ea6e4dc6c51c859f27b49fa6f97ff8bb18cf5b55ae23949dfc24479e4174b19c5cdc1da25079d096b6bf1694e88a5d36c7f8af0b78e15a382ab')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf $_name
    test-env/bin/python -P -m unittest discover -s "tests" -t "." -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
