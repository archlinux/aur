# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=eccodes
pkgname=python-${_name}
pkgver=2.49.0
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
b2sums=('9674f66facd1c6ab650e6e74da18cb4e04687c248236b47c703a788b35af1261fc7a073429e583fd6f89b0e262e0892f13c9bf330617ed0cfa16cf195bf14a60')

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
