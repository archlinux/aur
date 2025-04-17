# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.2.3
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
    git
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
source=($pkgname::git+https://github.com/python-constraint/python-constraint#tag=$pkgver)
b2sums=('15fb3c13b154a836eacfdee42a59e9c9e9b788bc533ba305ffac0a11fb567e274db65419c345c04353197ed54b60bed65cb0e81b9614beebab7ad86af4eb27d4')

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf constraint
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" \
    pytest tests -o addopts="" -k "not test_util_benchmark"

}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
