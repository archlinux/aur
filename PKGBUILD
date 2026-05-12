# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
_name=${pkgname#python-}
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.20.0
pkgrel=1

arch=("any")
license=("MIT")

depends=(
    "python"
    "python-packaging"
    "python-shapely"
    "python-sqlalchemy"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools-scm"
    "python-wheel"
)
checkdepends=(
    "flake8"
    "python-alembic"
    "python-mysqlclient"
    "python-pytest"
    "python-pytest-benchmark"
    "python-pytest-cov"
    "python-pytest-html"
    "python-pytest-mypy"
    "python-rasterio"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("5ddfe227ad1b6b9a2042e88e9dcb435221e1e6ffdbc0ae19afdcd282543dbef42d38a357ed80b08654d0a758e5334bce057e4836f058f0fe2508ff3e84e9192c")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m pytest --exitfirst -k "not mysql and not postgresql and not mariadb"
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 COPYING.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
