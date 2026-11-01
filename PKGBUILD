# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrosm
_name=${pkgname#python-}
pkgdesc="A Python tool to parse OSM data from Protobuf format into GeoDataFrame."
url="https://pyrosm.readthedocs.io/"

pkgver=0.28.0
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
    "python-tqdm"
)
optdepends=(
    "python-igraph"
    "python-ipywidgets"
    "python-networkx"
    "python-pandana"
    "python-pandarm"
    "python-pyarrow"
    "python-pyyaml"
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
    "${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/HTenkanen/pyrosm/v${pkgver}/LICENSE"
    "python-pyrosm-numpy-2.5.patch"
)
b2sums=(
    "5a7ad10d2cab040a1797b163a0d3d69e650913cc7b349b6ece80a0d3aac7e6f3216377d7d11971caea46b7aa0c6fa900f7865ea6fa475dfcc2a450970a414816"
    "b812524e28d50854a4cf2ae537638d9c7db7b22693e69e2d251795a66fe41f9cd3e7c91185335adf472f5da6ab398f3c66a938a9d8ecf37098f8538979a91b91"
    "79311692ead7a86a86fde4d8fdaf6ed9ac0ce04f75b9c1ee47dd87464ce44d1f4cf7e240e7ed50a23825b0831259a27cd865ba5ab9f7647cd6da352779122727"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input "${srcdir}/python-pyrosm-numpy-2.5.patch"
}

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
