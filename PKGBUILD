# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.0.2
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
source=(
    $pkgname::git+https://github.com/python-constraint/python-constraint#tag=$pkgver
    fix-test.patch
)
b2sums=('d73d891a4d3a7a8ed90f8b3d004b0c157f90659e1c4aa7270929dbf599a7f841a48d6a0e7c32d7e06d1d59396a1aa15db2495107413953f7f0723974dfa426c0'
        'a0bfd614c3ee837dc88fcab1170a793f32b4d84a5714d9385e0b48e2c011ef209b360d0d1b3808cfe9c6e4d1b45db7c05f564a17136332dbc526509002bb54cb')

prepare() {
    patch -Np1 -d $pkgname < fix-test.patch
}

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
