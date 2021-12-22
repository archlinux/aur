# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-photutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.3.0
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io/"
license=('BSD')
makedepends=('cython>=0.28'
             'python-setuptools-scm'
             'python-extension-helpers'
             'python-astropy'
             'python-scikit-learn'
             'python-scikit-image'
             'python-sphinx-astropy'
             'graphviz')
checkdepends=('python-pytest-astropy' 'python-gwcs')
#-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ba383cb09f2e2c46be2a4054dbc37247')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}" #|| warning "Tests failed"
}

package_python-photutils() {
    depends=('python>=3.7' 'python-numpy>=1.17' 'python-astropy>=4.0')
    optdepends=('python-scipy>=1.6.0: To power a variety of features in several modules (strongly recommended)'
                'python-scikit-image>=0.14.2: Used in deblend_sources for deblending segmented sources'
                'python-scikit-learn>=0.19:  Used in DBSCANGroup to create star groups'
                'python-matplotlib>=2.2: To power a variety of plotting features (e.g. plotting apertures'
                'python-gwcs>=0.12: Used in make_gwcs to create a simple celestial gwcs object'
                'python-photutils-doc: Documentation for python-photutils'
                'python-bottleneck: Improves the performance of sigma clipping and other functionality that may require computing statistics on arrays with NaN values')
#               'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
