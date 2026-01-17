# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=eccodes
pkgname=python-${_name}
pkgver=2.45.0
pkgrel=1
pkgdesc="Python interface to the ecCodes GRIB/BUFR decoder/encoder"
arch=(any)
url=https://github.com/ecmwf/eccodes-python
license=(Apache-2.0)
depends=(
    eccodes
    python-attrs
    python-cffi
    python-findlibs
    python-numpy
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
)
checkdepends=(python-pytest)
source=($_name::git+https://github.com/ecmwf/$_name-python.git#tag=$pkgver)
b2sums=('518072952944ad2a690caee31bc5fd08e0ecd0adcee428bf60e28383a90a2e38fb22c10e8f0972a630ea73d8dc6e52f3cd75692a63a28692503b69c7f23115c5')

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
