# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=findlibs
pkgname=python-${_name}
pkgver=0.1.3
pkgrel=1
pkgdesc="A Python package that searches for shared libraries on various platforms"
arch=(any)
url=https://github.com/ecmwf/findlibs
license=(Apache-2.0)
depends=(python)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
)
checkdepends=(
    python-pyfakefs
    python-pytest
)
source=($_name::git+https://github.com/ecmwf/$_name.git#tag=$pkgver)
b2sums=('c8b5ac72cd78d25276b10f0e3c6ec6def565e37ca9efa21cb1d640733bf6833de706c7e75c1370b3a4473f5a47db3c9e890daee4fc12d256fc83067660a929e7')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf $_name
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
