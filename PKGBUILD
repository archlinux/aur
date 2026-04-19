# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-photutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=3.0.0
#_pkgver=${pkgver/.0}
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('cython>=3.1.2'
             'python-setuptools-scm>=8.1'
             'python-build'
             'python-installer'
             'python-extension-helpers>=1'
             'python-numpy>=2.0'
             'python-sphinx-astropy'
             'python-pydata-sphinx-theme'
             'python-sphinx-copybutton'
             'python-sphinx-design'
             'python-sphinx-reredirects'
             'python-matplotlib'
             'python-astropy'
             'python-rasterio'
             'python-scikit-image'
             'python-shapely'
             'graphviz')  # wheel required by new setuptools
# header: photutils/conftest.py
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-pytest-remotedata'
#             'python-pytest-xdist'
              'python-bottleneck'
              'python-regions'
              'python-gwcs'
              'python-tqdm')    # scipy matplotlib <- scikit-image shapely rasterio already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/astropy/photutils/releases/download/${pkgver}/${_pyname}-${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${_pkgver}.tar.gz"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/M6707HH.fits"
##      "https://github.com/astropy/photutils-datasets/raw/main/data/SA112-SF1-001R1.fit.gz"
##      "https://github.com/astropy/photutils-datasets/raw/main/data/SA112-SF1-ra-dec-list.txt"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/hst_wfc3ir_f160w_simulated_starfield.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch1_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch2_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch3_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/irac_ch4_flight.fits"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/spitzer_example_catalog.xml"
#       "https://github.com/astropy/photutils-datasets/raw/main/data/spitzer_example_image.fits"
#       'datasets-use-local.patch')
md5sums=('3481b36f4ba8566c6e0d4bc5bc883150')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
##   cd ${srcdir}/${_pyname}-${_pkgver}
#
##   sed -e "/bool8/a \	ignore:jsonschema.exceptions.RefResolutionError is deprecated:DeprecationWarning" \
##       -i setup.cfg
##   install -Dm644 "${srcdir}"/{*.fit*,*.txt,*.xml} -t ${_pyname}/datasets/data
#    install -Dm644 "${srcdir}"/{*.fit*,*.xml} -t ${_pyname}/datasets/data
#    patch -Np1 -i "${srcdir}/datasets-use-local.patch"
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # --remote-data=any #
}

package_python-photutils() {
    depends=('python>=3.11' 'python-numpy>=2.0' 'python-astropy>=6.1.4' 'python-scipy>=1.13')
    optdepends=('python-scikit-image>=0.23: Required to deblend segmented sources'
                'python-matplotlib>=3.9: To power a variety of plotting features (e.g. plotting apertures)'
                'python-gwcs>=0.20: Required in make_gwcs to create a simple celestial gwcs object.'
                'python-bottleneck>=1.4: Improves the performance of sigma clipping and other functionality that may require computing statistics on arrays with NaN values'
                'python-tqdm>=4.66: Required to display optional progress bars'
                'python-rasterio>=1.4: Required to convert source segments into polygon objects'
                'python-regions>=0.9: Required to perform aperture photometry using region objects'
                'python-shapely>=2.0: Required to convert source segments into polygon objects'
                'python-photutils-doc: Documentation for python-photutils')
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#   cd ${srcdir}/${_pyname}-${_pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
