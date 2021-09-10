# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sncosmo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.6.0
pkgrel=1
pkgdesc="Python library for supernova cosmology"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io"
license=('BSD')
makedepends=('cython' 'python-numpy')
checkdepends=('python-pytest-astropy' 'python-scipy' 'python-astropy' 'python-extinction' 'python-iminuit' 'python-emcee' 'python-nestle' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('8ca17749ef0257330b9e93d268b9a25d')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package() {
    depends=('python>=3.5' 'python-scipy>=0.19.0' 'python-astropy>=1.3.0' 'python-extinction>=0.4.2')
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
