# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-osmnet"
_name=${pkgname#python-}
pkgdesc="Tools for the extraction of OpenStreetMap street network data "
url="http://udst.github.io/osmnet/"

pkgver=0.2
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
    "python-pytest"
    "python-pytest-cov"
)

source=("${_name}-${pkgver}.tar.gz::https://github.com/UDST/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("30bb6297ae5645b4fe6d82fc3eae2bdf80e2007d328e217ce044bb6ea699c0a05a65acab31086eb04bf914d6fd4dcfc2ff6e0aec5f10b7eaa5ac25668820da78")

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
