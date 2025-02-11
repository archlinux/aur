# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.1.0
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
b2sums=('d7503c8aba543458bb198e16c35beddaf944d3f4caec39b3ebc450ea6050642486a9c454dbf11c6548f574475a2dedc5cab92092a7eafb3a361da9de10c26cbd')

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
    pytest tests -o addopts=""
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
