# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroplan
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.8
pkgrel=1
pkgdesc="A python package to help astronomers plan observations"
arch=('i686' 'x86_64')
url="https://astroplan.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-sphinx-astropy'
             'python-astroquery'
             'graphviz')
checkdepends=('python-pytest-doctestplus')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#       "http://hpiers.obspm.fr/iers/eop/eopc04/eopc04_IAU2000.62-now"
#       "https://skyview.gsfc.nasa.gov/tempspace/fits/skv9820097384828.fits"
        'fix_doc_index_astropy_link.patch')
md5sums=('5595baf9469ca8c21b5ad05309ec6798'
         'be56be5926b43589b273c16544c5241a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib" || warning "Tests failed"
}

package_python-astroplan() {
    depends=('python>=3.5' 'python-numpy>=1.10' 'python-astropy>=1.3' 'python-pytz')
    optdepends=('python-matplotlib: Plotting support'
                'python-astroquery: Astroquery support'
                'python-astroplan-doc: Documentation for astroplan')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
#   install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-astroplan-doc() {
    pkgdesc="Documentation for Python astroplan module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
