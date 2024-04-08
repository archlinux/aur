# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
#_name=${pkgname#python-}
_name="GeoAlchemy2"
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.14.7
pkgrel=1

arch=("any")
license=("MIT")

depends=(
    "python"
    "python-packaging"
    "python-shapely"
    "python-sqlalchemy>=1.4"
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
    "python-pytest-cov"
    "python-pytest-html"
    "python-pytest-mypy"
    "python-rasterio"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("6b77f0d471636f4b961377bab4f3e9ac61c8a34b6d497d7ab720b8a0e94b60573255ba013ee3e90ad513584ebe02a4ae422b9d63574adef683d43c72d8059cc4")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m pytest --exitfirst -k "not mysql and not postgresql"
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 COPYING.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
