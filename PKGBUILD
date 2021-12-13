# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrosm
_name=${pkgname#python-}
pkgdesc="A Python tool to parse OSM data from Protobuf format into GeoDataFrame."
url="https://pyrosm.readthedocs.io/"

pkgver=0.6.1
pkgrel=4

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
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
checkdepends=(
    "python-anyio"
    "python-igraph"
    "python-networkx"
    "python-pandana"
    "python-pytest"
    "python-pytest-cov"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/HTenkanen/pyrosm/v${pkgver}/LICENSE"
)
sha256sums=(
    "53072bff13a4e96bb3f384e5a5b22bc63813115d633b8882e596856d8441cd2b"
    "ae4f776adf4385747f78ad16b5a162814fefe8557f18433cc772a9734716b3a7"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="build/lib.linux-$CARCH-${python_version}" pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    cd "${srcdir}"
    install -Dm644 "${pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
