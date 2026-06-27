# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-regions
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.12
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=8.2'
             'cython>=3.1.2'
             'python-build'
             'python-installer'
             'python-numpy>=2.0'
             'python-extension-helpers>=1.3'
             'python-sphinx-astropy'
             'python-sphinx-copybutton'
             'python-sphinx_design'
#            'python-matplotlib'
             'python-astropy'
             'python-shapely'
             'graphviz')  # wheel required by new setuptools
# regions/conftest.py
checkdepends=('python-pytest-astropy-header'
#             'python-pytest-xdist'
              'python-pytest-doctestplus'
              'python-pytest-remotedata'
              'python-gwcs'
              'python-matplotlib') # matplotlib, shapely already in makedepends
#             'python-pytest-arraydiff'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://www.astropy.org/astropy-data/tutorials/FITS-images/HorseHead.fits"
#       "http://data.astropy.org/allsky/allsky_rosat.fits"
#       "https://www.astropy.org/astropy-data/photometry/M6707HH.fits"
#       'doc-use-local-fits.patch'
#   )
md5sums=('9a46adbbcb8d3cf17b24a53b126dbbe8')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -e "/error/a \    'ignore:Test functions should:pytest.PytestReturnNotNoneWarning'," \
        -e "/error/a \    'ignore:Setting the dtype on a NumPy array:DeprecationWarning'," \
        -e "/error/a \    'ignore:Setting the shape on a NumPy array:DeprecationWarning'," \
        -e "/error/a \    'ignore:The chararray class:DeprecationWarning'," -i pyproject.toml
#   cp ${srcdir}/*.fits* docs/_static
#   patch -Np1 -i "${srcdir}/doc-use-local-fits.patch"

}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --remote-data #
}

package_python-regions() {
    depends=('python>=3.11' 'python-numpy>=2.0' 'python-astropy>=6.1.7')
    optdepends=('python-matplotlib>=3.9: Plotting support'
                'python-shapely>=2.1: Managing geometric objects'
                'python-regions-doc: Documentation for AstroPy Regions')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-regions-doc() {
    pkgdesc="Documentation for AstroPy Regions"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
