# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.0.0
pkgrel=1
pkgdesc="Module to solve Constraint Solving Problems (CSP) over finite domain"
arch=(x86_64)
url=https://github.com/python-constraint/python-constraint
license=(BSD-2-Clause)
depends=(
    cython
    python
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
    python-setuptools
    python-wheel
)
checkdepends=(
    python-pep440
    python-pytest
    python-tomli
)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz)
b2sums=('18997ad1424124242b2f9d8d692edb74c2d71e84cf8e85bcde5f08683abef8efb7d63d76178331a000ca087b79df66853eab0f903695ba8dcdb24886f606ba9c')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf constraint
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" \
    pytest tests -o addopts="" -k "not test_if_compiled"
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    # Delete installed tests
    rm -r "$pkgdir"/usr/lib/python$python_version/site-packages/tests
}
