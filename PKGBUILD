# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-osmnet"
_name=${pkgname#python-}
pkgdesc="Tools for the extraction of OpenStreetMap street network data "
url="http://udst.github.io/osmnet/"

pkgver=0.1.7
pkgrel=1

arch=("any")
license=("AGPL-3.0-only")

makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "python"
    "python-geopandas"
    "python-numpy"
    "python-pandas"
    "python-requests"
    "python-shapely"
)
checkdepends=(
    "python-coveralls"
    "python-pycodestyle"
    "python-pytest"
    "python-pytest-cov"
)

source=("${_name}-${pkgver}.tar.gz::https://github.com/UDST/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("5e047107f4836737e373da1aed549eb4227d67b5de196bda8a3de1d575e34f88c3fa7bbbf3aea15fb6cdbadadabfa8b3fe3ccc6196329ceafc7f6a05bb6e17dd")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    # skip some tests as they fetch remote data and expect it to not have
    # changed since 2021 ...
    local TESTS=(
        "not test_make_osm_query"
        "and not test_node_pairs_one_way"
        "and not test_node_pairs_two_way"
        "and not test_parse_network_osm_query"
        "and not test_intersection_nodes2"
    )
    python -m pytest -k "${TESTS[*]}"
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
