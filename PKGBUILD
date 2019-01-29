# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gammapy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.10
pkgrel=1
pkgdesc="A Python package for gamma-ray astronomy"
arch=('i686' 'x86_64')
url="https://gammapy.org/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy' 'python-astropy-helpers>=3.1' 'python2-astropy-helpers')
#'python-sphinx-astropy' 'python-nbsphinx' 'python-sphinx-click' 'python-click' 'python-regions')
checkdepends=('python-pytest-astropy'
#             'python2-pytest'
              'python-astropy'
#             'python2-yaml'
              'python-yaml'
#             'python2-click'
              'python-click'
#             'python2-regions'
              'python-regions'
#             'python2-astropy-healpix'
              'python-astropy-healpix')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bb635dd4c923a89920f37bc3061b2812')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
#   msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

#   msg "Checking Python2"
#   cd ${srcdir}/${pyname}-${pkgver}-py2
#   python2 setup.py test
}

package_python2-gammapy() {
    depends=('python2>=2.7' 'python2-yaml' 'python2-astropy>=1.0.2' 'python2-regions' 'python2-click' 'python2-pytest32' 'python2-astropy-healpix')
    optdepends=('python2-reproject: For numerical methods'
#               'python2-yaml: For YAML data handling (config and results files)'
                'python2-iminuit: For fitting by optimization'
                'python2-uncertainties: For linear error propagation'
                'python2-matplotlib: For plotting'
                'python2-emcee: For fitting by MCMC sampling'
                'python2-healpy: For HEALPIX data handling'
                'python2-naima: For SED modeling'
#               'python-gammapy-doc: Documentation for Gammapy'
#               'python2-pytest<3.7: For testing'
                'python2-sherpa: For modelling and fitting')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/gammapy{,2}
}

package_python-gammapy() {
    depends=('python>=3.5' 'python-yaml' 'python-astropy>=1.0.2' 'python-regions' 'python-click' 'python-astropy-healpix')
    optdepends=('python-reproject: For numerical methods'
#               'python-yaml: For YAML data handling (config and results files)'
                'python-iminuit: For fitting by optimization'
                'python-uncertainties: For linear error propagation'
                'python-matplotlib: For plotting'
                'python-emcee: For fitting by MCMC sampling'
                'python-healpy: For HEALPIX data handling'
                'python-naima: For SED modeling'
#               'python-gammapy-doc: Documentation for Gammapy'
#               'python-pytest-astropy: For testing'
                'python-sherpa: For modelling and fitting')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-gammapy-doc() {
#    pkgdesc="Documentation for Gammapy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
