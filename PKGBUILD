# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-obp
pkgname=python-${_name}
pkgver=0.3.0
pkgrel=1
pkgdesc="An addon to reduce the depth of circuits with operator backpropagation"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-obp
license=(Apache-2.0)
depends=(
    python-numpy
    python-qiskit
    python-qiskit-ibm-runtime
    python-matplotlib
)
makedepends=(
    python-build
    python-installer
    python-hatchling
)
checkdepends=(
    python-pytest
    python-pytest-subtests
    python-qiskit-addon-utils
)
source=($_name-$pkgver.tar.gz::https://github.com/Qiskit/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('d4e750ca660f8670623fff8933a255ab4f6795b83c6aafb2ff6a6c599512092f7f4e031fc213ed266ad79b768d4cdaa06447d5d90071576e42992529f2c9573d')

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
