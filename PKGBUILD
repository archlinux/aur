# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sncosmo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.7.1
pkgrel=1
pkgdesc="Python library for supernova cosmology"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy')
#'python-astropy' 'python-extinction' 'python-sphinx-gallery' 'python-iminuit')
checkdepends=('python-pytest-astropy' 'python-astropy' 'python2-astropy' 'python-extinction' 'python-iminuit')
#'python2-pytest' 'python2-extinction' 'python-nestle')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fdc70cb1f9c7d49397a7589829694162')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
#    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test
#
#    msg "Checking Python2"
#    cd ${srcdir}/${_pyname}-${pkgver}-py2
#    python2 setup.py test
}

package_python2-sncosmo() {
    depends=('python2>=2.7' 'python2-astropy' 'python2-extinction')
    optdepends=('python2-matplotlib: For plotting functions'
                'python2-iminuit: For light curve fitting using the Minuit minimizer in sncosmo.fit_lc'
                'python2-emcee: For MCMC light curve parameter estimation in sncosmo.mcmc_lc'
                'python2-nestle: For nested sampling light curve parameter estimation in sncosmo.nest_lc'
                'python2-corner: For plotting results from the samplers sncosmo.mcmc_lc and sncosmo.nest_lc'
                'python2-pytest<3.7: For testing'
                'python-sncosmo-doc: Documentation for SNCosmo')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sncosmo() {
    depends=('python>=3.4' 'python-astropy' 'python-extinction')
    optdepends=('python-matplotlib: For plotting functions'
                'python-iminuit: For light curve fitting using the Minuit minimizer in sncosmo.fit_lc'
                'python-emcee: For MCMC light curve parameter estimation in sncosmo.mcmc_lc'
                'python-nestle: For nested sampling light curve parameter estimation in sncosmo.nest_lc'
                'python-corner: For plotting results from the samplers sncosmo.mcmc_lc and sncosmo.nest_lc'
                'python-sncosmo-doc: Documentation for SNCosmo')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sncosmo-doc() {
#    pkgdesc="Documentation for Python sncosmo module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
