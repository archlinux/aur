# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrosm
_name=${pkgname#python-}
pkgdesc="A Python tool to parse OSM data from Protobuf format into GeoDataFrame."
url="https://pyrosm.readthedocs.io/"

pkgver=0.6.2
pkgrel=2

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
    "python-pyrobuf"
    "python-rapidjson"
    "python-shapely"
)
optdepends=(
    "python-igraph"
    "python-networkx"
    "python-pandana"
)
checkdepends=(
    "${optdepends[@]}"
    "python-pytest"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/HTenkanen/pyrosm/v${pkgver}/LICENSE"
    "python-pyrosm-cykhash-2.0.1.patch"
)
b2sums=(
    "d19c32ceaa72444f08ba913f92fb9bf489fb980adad6f621851e12ca14ad9787feb6445270cbf5f86cce1db75ef899cd5bdabd08c045081c239967b467f47fc1"
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
