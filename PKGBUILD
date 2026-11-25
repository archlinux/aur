# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=eccodes
pkgname=python-${_name}
pkgver=2.50.1
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
b2sums=('680c1eddf237b2c62efe0f2f09a28471257432323e8b2e0bb8621d8ec2aaf3103b0e8dc98c993b3197178571603a5bcf71204dc972f9da9a77fcc73e0298b67a')

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
