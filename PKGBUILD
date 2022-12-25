# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-cartopy
pkgver=0.21.1
pkgrel=1
pkgdesc="A cartographic Python library with Matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/"
depends=(
    'geos' 'python-certifi' 'python-matplotlib' 'python-numpy' 'python-pillow'
    'python-pyproj' 'python-pyshp' 'python-scipy' 'python-shapely' 'python-six'
)
optdepends=(
    'python-fiona: faster shapefile reading'
    'python-gdal: for use with SRTM data'
    'python-pyepsg: interface to https://epsg.io'
    'python-pykdtree: faster warping of images'
    'python-owslib: access OGC clients'
)
makedepends=(
    'cython' 'python-build' 'python-installer' 'python-setuptools'
    'python-setuptools-scm' 'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-mpl' 'python-flufl-lock')
license=('LGPL3')
arch=('x86_64')

_pypi=Cartopy
source=(
    "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
    '89d5649712c8582231c6e11825a04c85f6f0cee94dbb89e4db23eabca1cc250a'
)

prepare() {
    cd "$_pypi-$pkgver"

    # Remove pre-processed Cython extensions so we can generate a local version.
    rm lib/cartopy/trace.cpp

    # The Arch version of NumPy will always meet NEP29, so this is an unneeded dependency.
    sed -i -e 's/oldest-supported-numpy/numpy/g' pyproject.toml
}

build() {
    cd "$_pypi-$pkgver"
    FORCE_CYTHON=1 python -m build --wheel --no-isolation
}

check() {
    cd "$_pypi-$pkgver"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

    # The deselected tests fail an image comparison due to small changes in the
    # size and position of text labels.
    cd "build/lib.linux-$CARCH-cpython-${python_version}"
    pytest cartopy \
        -k "not test_gridliner and not test_contour_label and not test_annotate" \
        --ignore-glob="*mpl/test_ticks.py"
}

package() {
    cd "$_pypi-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
