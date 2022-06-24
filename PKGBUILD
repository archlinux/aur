# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gammapy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.20.1
pkgrel=1
pkgdesc="A Python package for gamma-ray astronomy"
arch=('i686' 'x86_64')
url="https://gammapy.org"
license=('BSD')
makedepends=('cython'
             'python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
#'python-sphinx-astropy' 'python-sphinx_rtd_theme' 'python-nbsphinx' 'python-sphinx-click' 'python-click' 'python-yaml' 'python-regions' 'python-naima')
#checkdepends=('python-pydantic'
#              'python-click'
#              'python-yaml'
#              'python-scipy'
#              'python-regions')
checkdepends=('python-pytest-remotedata'
              'python-pytest-astropy-header'
              'python-scipy'
              'python-regions'
              'python-click'
              'python-matplotlib'
              'python-iminuit'
              'python-pydantic')
#             'python-healpy'
#             'python-reproject'
#             'python-iminuit'
#             'python-sherpa'
#             'jupyter-nbformat'
#             'python-sphinx'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a061826514fc5915660296b351f386a2')

get_pyver() {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname}*egg-info \
        build/lib.linux-${CARCH}-$(get_pyver)/${_pyname}-${pkgver}-py$(get_pyver).egg-info
    PYTHONPATH="build/lib.linux-${CARCH}-$(get_pyver)" pytest "build/lib.linux-${CARCH}-$(get_pyver)" || warning "Tests failed"
#   python setup.py test
}

package_python-gammapy() {
    depends=('python>=3.8' 'python-scipy>=1.4' 'python-yaml>=5.1' 'python-astropy>=5.0' 'python-regions>=0.5.0' 'python-click>=7.0' 'python-pydantic>=1.4' 'python-iminuit>=2.8.0' 'python-matplotlib>=3.4')
    optdepends=('python-pandas: For working with tables'
                'python-emcee: For fitting by MCMC sampling'
                'python-corner: For MCMC corner plots'
                'python-healpy: For HEALPIX data handling'
                'python-naima: For SED modeling'
#               'python-gammapy-doc: Documentation for Gammapy'
#               'python-pytest-astropy: For testing'
                'python-sherpa: For modelling and fitting'
                'python-parfive: For example data and tutorial notebook download')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-gammapy-doc() {
#    pkgdesc="Documentation for Gammapy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
