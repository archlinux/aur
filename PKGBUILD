# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.0.0
pkgrel=2
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
b2sums=('491437caab5c5330742ca69e74e01c4646cbe85a6f987e53969c8307b403d3e975c430219c71aec9277b2c193c9eaeaa35c295494a0abe4ee9f8f6045dbab8ee')

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
    pytest tests -o addopts="" -k "not test_if_compiled"
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    # Shared libraries are not installed (https://github.com/python-constraint/python-constraint/issues/86)
    for lib in "build/lib*/constraint/*"; do
        install -m755 $lib "$pkgdir"/usr/lib/python$python_version/site-packages/constraint/
    done
    # Delete installed tests (https://github.com/python-constraint/python-constraint/pull/85)
    rm -r "$pkgdir"/usr/lib/python$python_version/site-packages/tests
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
