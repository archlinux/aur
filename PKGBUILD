# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Sergio Davies <newsletter dot sergio at gmail dot com>
_name=quantities
pkgname=python-$_name
pkgver=0.17.0
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
b2sums=('ca9919b78b2fd22ba3095e7c57219e8534c4a7990fc394d7ed4fa7af2fbde01faa3c325d2cf30a0ca44c7ae0230520cb985a9f0923b49126d72f4610c82de381'
        '106495846afcedd9522ef251dcc717cf23d2fb9f8285d7c780eb8cac1efc1898c33bbadef4ba604d0ae4e7327cd4a0e2241da3b549223683d67de7eecf9bcbc8')

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
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    mv $_name/tests .
    rm -rf $_name
    test-env/bin/python -P -m pytest -o addopts="" tests
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Remove tests
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    rm -rf "$pkgdir"/usr/lib/python$python_version/site-packages/quantities/tests
    install -Dm644 doc/user/license.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

