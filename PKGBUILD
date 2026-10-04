# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-topojson"
_name=${pkgname#python-}
pkgdesc="Encode spatial data as topology in Python"
url="https://mattijn.github.io/topojson/"

pkgver=2.0
pkgrel=1

arch=("any")
license=("BSD-3-Clause")

depends=(
    "python"
    "python-numpy"
    "python-shapely"
)
makedepends=(
    "python-build"
    "python-flit"
    "python-installer"
    "python-wheel"
)
checkdepends=(
    "python-altair"
    "python-fiona"
    "python-geojson"
    "python-geopandas"
    "python-ipywidgets"
    "python-pyshp"
    "python-pytest"
    "python-simplification"
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mattijn/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
    "python-topojson-flit-4.patch"
)
b2sums=(
    "400cb72652ac3a4e2c167f53eed7f6701b64797192042867966348c029e9575c295bed284d1ba663a91746648736d4365140e14e510896805ed090bf26170f96"
    "b10395a1d9adfeb3011d728dcb0fd2b73efe56b060ae3eb0875a581adb078f4eedf3a65db438ab8fa95d9a80668d2c6be58f0327f694eaaf34689354d55f5ac6"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input "${srcdir}/python-topojson-flit-4.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m pytest .
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
