# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-cartopy
pkgver=0.18.0
pkgrel=1
pkgdesc="A cartographic python library with matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/docs/latest/"
depends=('python-numpy' 'python-six' 'python-shapely' 'python-pyshp' 'proj'
         'geos' 'python-matplotlib' 'python-pillow' 'python-scipy')
optdepends=('python-fiona: faster shapefile reading'
            'python-gdal: for use with SRTM data'
            'python-pyepsg: interface to https://epsg.io'
            'python-owslib: access OGC clients')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest' 'python-filelock')
license=('LGPL3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SciTools/cartopy/archive/v${pkgver}.tar.gz")
md5sums=('792c63511641c843759c5b774f2a8b33')
sha1sums=('e1eb5b99f8d504ad75e99a788566fcf14da97171')
sha256sums=('493ced4698361ffabec1a213d2b711dc836117242c304f3b93f5406182fd8bc2')

build() {
    cd "$srcdir/cartopy-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/cartopy-${pkgver}"

    # The deselected tests fail an image comparison due to small changes in the
    # size and position of text labels.
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    PYTHONDONTWRITEBYTECODE=1 pytest \
        -k "not test_gridliner and not test_contour_label" \
        "build/lib.linux-${CARCH}-${PYVER}/cartopy"
}

package() {
    cd "$srcdir/cartopy-${pkgver}"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
