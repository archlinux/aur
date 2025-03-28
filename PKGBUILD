# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=qiskit-addon-obp
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc="An addon to reduce the depth of circuits with operator backpropagation"
arch=(any)
url=https://github.com/Qiskit/qiskit-addon-obp
license=(Apache-2.0)
depends=(
    python-numpy
    python-qiskit
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
b2sums=('b1966dca7a0a4906cb0283f522a683d225b4b6934e432e90634cbebc912a54c387823d90cfb036d6eea0dbd798343605d17753cef7c115e96f924ef993311c27')

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
