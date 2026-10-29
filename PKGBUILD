# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=findlibs
pkgname=python-${_name}
pkgver=0.1.4
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
b2sums=('cfda2520614d08c9b7c1e3264169c8fff9f1ff33b33ac2a770d7084d877bc4e7c9680defc0a276c217cfdd91b286597264b98f1c167166c9c9499a42ae22466e')

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
