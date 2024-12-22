# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=1.4.0
pkgrel=9
pkgdesc="Module implementing support for handling CSPs (Constraint Solving Problems) over finite domain"
arch=(any)
url=https://github.com/python-constraint/python-constraint
license=(BSD-2-Clause)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz)
b2sums=('5ada7926f226536a1384bf9a082da41824e46d683ee71a278c50e1e5ca0a21eb3acbde4c0b47d6b48c53864ab4ea47d602fc9acb976423035aee74b0c6f3ed85')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd $pkgname-$pkgver
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    # Delete example folder to avoid conflict files with python-cvxpy
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    rm -r "$pkgdir"/usr/lib/python$python_version/site-packages/examples
}
