# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sncosmo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.10.0
pkgrel=1
pkgdesc="Python library for supernova cosmology"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io"
license=('BSD')
makedepends=('cython'
             'python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
checkdepends=('python-pytest'
              'python-astropy'
              'python-scipy'
              'python-extinction'
              'python-iminuit'
              'python-emcee'
              'python-nestle'
              'python-matplotlib')
#             'python-yaml'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('952e48f8b499e611d44e652f9c337e35')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" -m "not might_download" || warning "Tests failed" # -vv --color=yes
}

package() {
    depends=('python-scipy>=1.3.0' 'python-astropy>=3.1' 'python-extinction>=0.4.4' 'python-yaml>=3.13')
    optdepends=('python-matplotlib: For plotting functions'
                'python-iminuit: For light curve fitting using the Minuit minimizer in sncosmo.fit_lc'
                'python-emcee: For MCMC light curve parameter estimation in sncosmo.mcmc_lc'
                'python-nestle: For nested sampling light curve parameter estimation in sncosmo.nest_lc'
                'python-corner: For plotting results from the samplers sncosmo.mcmc_lc and sncosmo.nest_lc'
                'python-sncosmo-doc: Documentation for SNCosmo')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
