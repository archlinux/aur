# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-utils
pkgname=python-${_name}
pkgver=0.1.1
pkgrel=1
pkgdesc="Utilities to support workflows leveraging Qiskit addons"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-utils/
license=(Apache-2.0)
depends=(
    python-numpy
    python-qiskit
    python-rustworkx
)
makedepends=(
    python-build
    python-installer
    python-hatchling
)
checkdepends=(
    python-pytest
    python-qiskit-qasm3-import
)
source=($_name-$pkgver.tar.gz::https://github.com/Qiskit/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('8afa4cd344668b5919d73a12f1265bc27f89c9dd3f62f3d534b9a86efb0cfbfea31d64c2b1375fd2f6ddbb95de2bf70d2cc2c5d06966f3a7a61e0441d22a6414')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf ${_name//-/_}
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest test
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
