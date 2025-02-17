# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
_name=${pkgname#python-}
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.17.1
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
b2sums=("d9db320f32ede62fadf6bf58e254492129d2896908d1c1d1e161f8bbb2d850b1bf43f84321a7917ae37b70c54e0d8edb2692a4873fde81866620bc195c413210")

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
