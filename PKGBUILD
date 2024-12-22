# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=arraylias
pkgname=python-${_pkgname}
pkgver=0.1.1
pkgrel=5
pkgdesc="A Python library for automatic aliasing of multiple array libraries"
arch=(any)
url=https://github.com/qiskit-community/arraylias
license=(Apache-2.0)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(
    python-numpy
    python-pytest
    python-scipy
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/qiskit-community/$_pkgname/archive/$pkgver.tar.gz)
b2sums=('4adeef464d0187786ed641ac13061304ca2a87bccff70e5c8f28ec63ed6ac7213e29c5d9b651824fc2f2a515daa222e2c48b6a4a2d338fc411fe95b9466ff346')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    cd $_pkgname-$pkgver
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest test
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
