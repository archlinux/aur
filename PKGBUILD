# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-cartopy
pkgver=0.23.0
pkgrel=1
pkgdesc="A cartographic Python library with Matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/"
depends=(
    'python-matplotlib' 'python-numpy' 'python-pillow'
    'python-pyproj' 'python-pyshp' 'python-scipy' 'python-shapely'
)
optdepends=(
    'python-beautifulsoup4: for use with SRTM data'
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
license=('BSD-3-Clause')
arch=('x86_64')

_pypi=Cartopy
source=(
    "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
    '231f37b35701f2ba31d94959cca75e6da04c2eea3a7f14ce1c75ee3b0eae7676'
)

prepare() {
    cd "$_pypi-$pkgver"

    # Remove pre-processed Cython extensions so we can generate a local version.
    rm lib/cartopy/trace.cpp
}

build() {
    cd "$_pypi-$pkgver"

    # pyproject.toml specifies numpy>=2.0.0rc1, but states that this is for
    # building the wheels they release and building against numpy 1.x is fine.
    FORCE_CYTHON=1 python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd "$_pypi-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer "dist/Cartopy-$pkgver-"*.whl

    # The deselected tests fail an image comparison due to small changes in the
    # size and position of text labels.
    test-env/bin/python -m pytest --import-mode importlib lib/cartopy/tests \
        -k "not test_gridliner and not test_contour_label and not test_annotate" \
        --ignore-glob="*mpl/test_ticks.py"
}

package() {
    cd "$_pypi-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/Cartopy-$pkgver-"*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    # Remove tests from final package.
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -r "$pkgdir/$site_packages/cartopy/tests"
}
