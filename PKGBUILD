# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
#_name=${pkgname#python-}
_name="GeoAlchemy2"
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.14.5
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
b2sums=('90c7c3b71031ec780bbd644f38919e77c042fe4d6f34c80bdbec586245ce2fb8e1515ea0900bc38b149da811eeb629172ef357d57c48254188de6b716258e3ba')

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
