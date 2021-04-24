# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sncosmo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.5.0
pkgrel=1
pkgdesc="Python library for supernova cosmology"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io"
license=('BSD')
makedepends=('cython' 'python-numpy')
checkdepends=('python-pytest-astropy' 'python-scipy' 'python-astropy' 'python-extinction' 'python-iminuit')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2a1f7c67b4c10734c8c1a7f8e01c74a3')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp "build/lib.linux-${CARCH}-${_pyver}/${_pyname}/salt2utils.cpython-${_pyver/./}-${CARCH}-linux-gnu.so" "${_pyname}"
    pytest || warning "Tests failed"
}

package() {
    depends=('python>=3.5' 'python-scipy>=0.9.0' 'python-astropy>=1.0.0' 'python-extinction>=0.2.2')
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
