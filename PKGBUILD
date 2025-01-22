# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sncosmo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.12.0
pkgrel=1
pkgdesc="Python library for supernova cosmology"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('cython'
             'python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-astropy'
              'python-scipy'
              'python-extinction'
              'python-h5py'
              'python-iminuit'
              'python-emcee'
              'python-nestle'
              'python-looseversion'
              'python-matplotlib')
#             'python-yaml'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b89ac0ab5979ca4fdddc466e928b7c9d')

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

    pytest -m "not might_download" "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package() {
    depends=('python-scipy>=1.10.0'
             'python-astropy>=5.0'
             'python-extinction>=0.4.6'
             'python-h5py>=3.11'
             'python-yaml>=6.0.1'
             'python-looseversion>=1.0.0')
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
