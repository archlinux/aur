# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrosm
_name=${pkgname#python-}
pkgdesc="A Python tool to parse OSM data from Protobuf format into GeoDataFrame."
url="https://pyrosm.readthedocs.io/"

pkgver=0.7.0
pkgrel=1

arch=("any")
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
    "python-cykhash"
    "python-geopandas"
    "python-numpy"
    "python-pandas"
    "python-pyrobuf"
    "python-rapidjson"
    "python-shapely"
)
optdepends=(
    "python-igraph"
    "python-networkx"
    "python-pandana"
    "python-pandarm"
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
    "python-pyrosm-cykhash-2.0.1.patch"
)
b2sums=(
    "4c907ee0a736ac1ce68676c20990eadc6ba9c08428f18da10a627b28120bb4c1003d7ae9f150917f702a85beb4bb8a107d8a24f6983777e3d404df3398f0a85d"
    "f6b1ef1a7226efb7c32b58e56a939f0b843fa03bd0cbea401482407587aac1aec8225e83f0fc7cbf10f91dabb4953814c2edc2e0c326cbb887f25a29c7806253"
    "33f3c0fd8da497eb7aa666e8a54d6cdbc5171517c77085524b65427bf01221db34e50f61eff10d835bcbaeee311787a410ab7895c86faa9b8b082c8c51c27704"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input "${srcdir}/python-pyrosm-cykhash-2.0.1.patch"
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
