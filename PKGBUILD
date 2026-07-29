# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrosm
_name=${pkgname#python-}
pkgdesc="A Python tool to parse OSM data from Protobuf format into GeoDataFrame."
url="https://pyrosm.readthedocs.io/"

pkgver=0.13.0
pkgrel=1

arch=("x86_64")
license=("MIT")

makedepends=(
    "clang"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "cython"
    "python"
    "python-certifi"
    "python-cykhash"
    "python-geopandas"
    "python-numpy"
    "python-pandas"
    "python-protobuf"
    "python-rapidjson"
    "python-shapely"
)
optdepends=(
    "python-igraph"
    "python-networkx"
    "python-pandana"
    "python-pandarm"
    "python-pyarrow"
)
checkdepends=(
    "${optdepends[@]}"
    "python-black"
    "python-osmnx"
    "python-pyosmium"
    "python-pytest"
    "python-pytest-cov"
    "python-requests"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/HTenkanen/pyrosm/v${pkgver}/LICENSE"
)
b2sums=(
    "692e643fdbc1ad2739b10ec090799e0302f3ec96dbda82bd585f403bcd11044e4de3e86fc423fbf3978e8f241e95a2cafce13e9e19e5e5246f8420eda253b74d"
    "f6b1ef1a7226efb7c32b58e56a939f0b843fa03bd0cbea401482407587aac1aec8225e83f0fc7cbf10f91dabb4953814c2edc2e0c326cbb887f25a29c7806253"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    cythonize -3 --force pyrosm/*.pyx
    python setup.py build_ext --inplace
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}

    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="${srcdir}/${_name}-${pkgver}/build/lib.linux-${CARCH}-cpython-${python_version}"

    python -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}"
    install -Dm644 "${pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
