# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-cartopy
pkgver=0.19.0
pkgrel=1
pkgdesc="A cartographic Python library with Matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/docs/latest/"
depends=('python-numpy' 'python-six' 'python-shapely' 'python-pyshp' 'proj6'
         'geos' 'python-matplotlib' 'python-pillow' 'python-scipy')
optdepends=('python-fiona: faster shapefile reading'
            'python-gdal: for use with SRTM data'
            'python-pyepsg: interface to https://epsg.io'
            'python-owslib: access OGC clients')
makedepends=('python-setuptools' 'cython' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-flufl-lock')
license=('LGPL3')
arch=('x86_64')
source=(
  "cartopy-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cartopy/Cartopy-$pkgver.post1.tar.gz"
  'use-proj6.patch'
)
sha256sums=(
  '4b8b4773a98ed7009fe17d9b6ec87ac3ac62b7d14634d7768c190eadc647d576'
  'f0367e38237739fe4c4700353eeae34f892a102a16ff43012b4758fcba564e9b'
)

prepare() {
    cd "$srcdir/Cartopy-${pkgver}.post1"
    patch -p0 -i "$srcdir/use-proj6.patch"
}

build() {
    cd "$srcdir/Cartopy-${pkgver}.post1"
    FORCE_CYTHON=1 python setup.py build
}

check() {
    cd "$srcdir/Cartopy-${pkgver}.post1"

    # The deselected tests fail an image comparison due to small changes in the
    # size and position of text labels.
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    PYTHONDONTWRITEBYTECODE=1 pytest \
        -k "not test_gridliner and not test_contour_label" \
        "build/lib.linux-${CARCH}-${PYVER}/cartopy"
}

package() {
    cd "$srcdir/Cartopy-${pkgver}.post1"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
