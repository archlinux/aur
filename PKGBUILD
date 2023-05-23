# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrosm
_name=${pkgname#python-}
pkgdesc="A Python tool to parse OSM data from Protobuf format into GeoDataFrame."
url="https://pyrosm.readthedocs.io/"

pkgver=0.6.1
pkgrel=5

arch=("any")
license=("MIT")

makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "cython"
    "python"
    "python-cykhash"
    "python-geopandas"
    "python-numpy"
    "python-pygeos"
    "python-pyrobuf"
    "python-rapidjson"
    "python-shapely"
)
optdepends=(
    "python-igraph: convert graph to igraph.Graph"
    "python-networkx: convert graph to networkx.Graph"
    "python-pandana: convert graph to pandana.Network"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/HTenkanen/pyrosm/v${pkgver}/LICENSE"
)
sha256sums=(
    "53072bff13a4e96bb3f384e5a5b22bc63813115d633b8882e596856d8441cd2b"
    "ae4f776adf4385747f78ad16b5a162814fefe8557f18433cc772a9734716b3a7"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    cythonize -3 --force pyrosm/*.pyx
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}"
    install -Dm644 "${pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
