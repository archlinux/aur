# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-geoalchemy2"
_name=${pkgname#python-}
pkgdesc="Using SQLAlchemy with Spatial Databases"
url="https://geoalchemy-2.readthedocs.io/"

pkgver=0.15.1
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
b2sums=("52c7a088d3c5a4e919c66303757fed4662689face28a45c7f6ea8f46e212b6ab3d1f31aa9aaab7f4d880a9cee8482ed10b19d6286362fa44e33ca61d3c722e68")

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
