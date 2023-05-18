# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-photutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.8.0
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io"
license=('BSD')
makedepends=('cython>=0.29.30'
             'python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-extension-helpers'
             'python-numpy'
             'python-sphinx-astropy'
             'python-astropy'
             'python-rasterio'
             'python-scipy'
             'python-scikit-learn'
             'python-scikit-image'
             'graphviz')
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-pytest-remotedata'
              'python-matplotlib'
              'python-gwcs'
              'python-shapely')    # scipy scikit-image scikit-learn rasterio already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://github.com/astropy/photutils-datasets/raw/main/data/M6707HH.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/SA112-SF1-001R1.fit.gz"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/SA112-SF1-ra-dec-list.txt"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/hst_wfc3ir_f160w_simulated_starfield.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch1_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch2_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch3_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch4_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/spitzer_example_catalog.xml"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/spitzer_example_image.fits"
#       'datasets-use-local.patch')
md5sums=('25357b20b648e6a2a0a170c20a33a3e4')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
#   install -Dm644 "${srcdir}"/{*.fit*,*.txt,*.xml} -t ${_pyname}/datasets/data
#   patch -Np1 -i "${srcdir}/datasets-use-local.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv --color=yes --remote-data=any
}

package_python-photutils() {
    depends=('python>=3.8' 'python-numpy>=1.21' 'python-astropy>=5.0')
    optdepends=('python-scipy>=1.7.0: To power a variety of features in several modules (strongly recommended)'
                'python-scikit-image>=0.19.0: Used in deblend_sources for deblending segmented sources'
                'python-scikit-learn>=1.0:  Used in DBSCANGroup to create star groups'
                'python-matplotlib>=3.5.0: To power a variety of plotting features (e.g. plotting apertures'
                'python-gwcs>=0.18: Used in make_gwcs to create a simple celestial gwcs object'
                'python-photutils-doc: Documentation for python-photutils'
                'python-bottleneck: Improves the performance of sigma clipping and other functionality that may require computing statistics on arrays with NaN values'
                'python-tqdm: Used to display optional progress bars'
                'python-rasterio: Used for converting source segments into polygon objects'
                'python-shapley: Used for converting source segments into polygon objects')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
