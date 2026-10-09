# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=pdbufr
pkgname=python-${_name}
pkgver=0.15.1
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
b2sums=('7bc84358d776385fbe0baf9276202febf4bc74f1b5f603eefa38dd95831ac3d40912653adf5a557f9943b4be579dc9b24d5e9392b8c4a58ae6499ee9bf4ede7e')

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
