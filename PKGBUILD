# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=eccodes
pkgname=python-${_name}
pkgver=2.46.0
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
b2sums=('8fd14f1e5042a64425b62c2d46011889995bc67575bcf24ccc64c1b94d0a55aabbe153ee59f795f00d8803a443291be458d4bdb9032874949b2d602660aaf040')

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
