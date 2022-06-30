# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-cartopy
pkgver=0.20.3
pkgrel=1
pkgdesc="A cartographic Python library with Matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/"
depends=(
    'geos' 'proj' 'python-certifi' 'python-matplotlib' 'python-numpy' 'python-pillow'
    'python-pyproj' 'python-pyshp' 'python-scipy' 'python-shapely' 'python-six'
)
optdepends=(
    'python-fiona: faster shapefile reading'
    'python-gdal: for use with SRTM data'
    'python-pyepsg: interface to https://epsg.io'
    'python-pykdtree: faster warping of images'
    'python-owslib: access OGC clients'
)
makedepends=('python-setuptools' 'cython' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-flufl-lock')
license=('LGPL3')
arch=('x86_64')

_pypi=Cartopy
source=(
    "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
    '0d60fa2e2fbd77c4d1f6b1f9d3b588966147f07c1b179d2d34570ac1e1b49006'
)

build() {
    cd "$_pypi-$pkgver"
    FORCE_CYTHON=1 python setup.py build
}

check() {
    local PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    cd "$_pypi-$pkgver/build/lib.linux-$CARCH-$PYVER"

    # The deselected tests fail an image comparison due to small changes in the
    # size and position of text labels.
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. pytest cartopy \
        -k "not test_gridliner and not test_contour_label" \
        --ignore-glob="*mpl/test_ticks.py"
}

package() {
    cd "$_pypi-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
