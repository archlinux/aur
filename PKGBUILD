# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=2.0.1
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
    fix-no-shared-lib.patch::https://github.com/python-constraint/python-constraint/pull/88.patch
    fix-test.patch
)
b2sums=('2ba15be6bcd3a225d521a4f6ebe4d7f7dae83df7e412bc6751300abcb35942223064ec8a04c9e41e80c3b685af5a6a5c66b25fd2821bd34685c3457c3f0b2872'
        '49dc90682013708f1136754b32f912a2c6dfbf001fe953294e518e70202ae06825b9605cf9f8f7caacb24bcd25bf1b50e7d167b73030038acfe0b8a9eab82030'
        'a0bfd614c3ee837dc88fcab1170a793f32b4d84a5714d9385e0b48e2c011ef209b360d0d1b3808cfe9c6e4d1b45db7c05f564a17136332dbc526509002bb54cb')

prepare() {
    patch -Np1 -d $pkgname < fix-no-shared-lib.patch
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
