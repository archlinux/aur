# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-cartopy
pkgver=0.26.0
pkgrel=1
pkgdesc="A cartographic Python library with Matplotlib support for visualisation"
url="https://scitools.org.uk/cartopy/"
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'python-matplotlib'
    'python-numpy'
    'python-packaging'
    'python-pillow'
    'python-pyproj'
    'python-pyshp'
    'python-scipy'
    'python-shapely'
)
optdepends=(
    'python-beautifulsoup4: for use with SRTM data'
    'python-fiona: faster shapefile reading'
    'python-gdal: for use with SRTM data'
    'python-owslib: access OGC clients'
    'python-pyepsg: interface to https://epsg.io'
    'python-pykdtree: faster warping of images'
)
makedepends=(
    'cython'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-mpl' 'python-flufl-lock')
license=('BSD-3-Clause')
arch=('x86_64')

_pypi=cartopy
source=(
    "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
    'b87a35835f30333760cc46194bd90b6a4958d12f488f50131d4c4c0962ad9c3c'
)

prepare() {
    cd "$_pypi-$pkgver"

    # Remove pre-processed Cython extensions so we can generate a local version.
    rm lib/cartopy/trace.cpp
}

build() {
    cd "$_pypi-$pkgver"
    FORCE_CYTHON=1 python -m build --wheel --no-isolation
}

check() {
    cd "$_pypi-$pkgver"
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer "dist/cartopy-$pkgver-"*.whl

    # Run the tests that are included in the wheel. Trying to run the tests in the
    # source directory often seems to import files from the source, rather than from
    # the installed copy, which fails as the compiled modules are not available.
    # The deselected tests fail an image comparison due to small changes in the
    # size and position of text labels.
    cd test-env/lib/python*/site-packages/cartopy/tests
    ../../../../../bin/python -m pytest \
        -k "not test_gridliner and not test_contour_label and not test_annotate" \
        --ignore-glob="*mpl/test_ticks.py"
}

package() {
    cd "$_pypi-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/cartopy-$pkgver-"*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    # Remove tests from final package.
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -r "$pkgdir/$site_packages/cartopy/tests"
}
