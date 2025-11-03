# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Sergio Davies <newsletter dot sergio at gmail dot com>
_name=quantities
pkgname=python-$_name
pkgver=0.16.2
pkgrel=1
pkgdesc="Support for physical quantities with units, based on NumPy"
arch=(any)
url=https://github.com/python-quantities/python-quantities
license=(BSD-3-Clause)
depends=(python-numpy)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
)
optdepends=("python-scipy: integrate using SciPy's trapezoid implementation")
checkdepends=(python-pytest)
source=(
    $_name::git+https://github.com/python-quantities/python-quantities#tag=v$pkgver
    fix-tests.patch
)
b2sums=('50760e4efa1a981811dfe3b26593688846532d1b9f3f73846e266f5fcbf03668b374ef10e91ec2e1a3607c75ae4983cc7dbee21be50bbf913dcf7067f809c34b'
        'dba5b5a95edb249d8d430500724e34eafe4a87a935eb6147c019797c437bba38bcbf3ffd6ca131cebec03e09674579add64d6ed63383308ce341049bb688ff70')

prepare() {
    # Modify imports to test from the installed wheel package
    patch -Np1 -d $_name < fix-tests.patch
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    mv $_name/tests .
    rm -rf $_name
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest tests
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Remove tests
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    rm -rf "$pkgdir"/usr/lib/python$python_version/site-packages/quantities/tests
    install -Dm644 doc/user/license.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

