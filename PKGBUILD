# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.5.0
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
b2sums=('9bdedef9c3f6003c3edadcac6f149151dfd3c2e90e6cd6f5bcf13890fdfc073154977dcab72a44db72190d8bb788f124a23cc5206be8354f40b21c5a9b010599')

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
