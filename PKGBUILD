# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=pdbufr
pkgname=python-${_name}
pkgver=0.14.2
pkgrel=1
pkgdesc="High-level BUFR interface for ecCodes"
arch=(any)
url=https://github.com/earthobservations/wetterdienst
license=(Apache-2.0)
depends=(
    python-attrs
    python-eccodes
    python-pandas
    python-pint
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
)
checkdepends=(
    python-pytest
    python-requests
)
source=($_name::git+https://github.com/ecmwf/$_name.git#tag=$pkgver)
b2sums=('e518bbfe22853e5196813de71d30ac4a09ba42e6aef95d7ef75326ac3aad5ed769d1b7a1857e890921cc960796f1c3b07d51c1f998c7352a070a72d5dac77d8f')

build() {
    cd $_name
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf src
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
