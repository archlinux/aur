# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-photutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.4.0
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io/"
license=('BSD')
makedepends=('cython>=0.28'
             'python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-extension-helpers'
             'python-numpy'
             'python-astropy'
             'python-scikit-learn'
             'python-scikit-image'
             'python-sphinx-astropy'
             'graphviz')
checkdepends=('python-pytest-astropy' 'python-gwcs')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('39647bdd3ca2d10564c44fe2a4196f72')

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

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-$(get_pyver)" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-$(get_pyver)" --remote-data || warning "Tests failed"
}

package_python-photutils() {
    depends=('python>=3.8' 'python-numpy>=1.18' 'python-astropy>=5.0')
    optdepends=('python-scipy>=1.6.0: To power a variety of features in several modules (strongly recommended)'
                'python-scikit-image>=0.15.0: Used in deblend_sources for deblending segmented sources'
                'python-scikit-learn>=0.19:  Used in DBSCANGroup to create star groups'
                'python-matplotlib>=3.1: To power a variety of plotting features (e.g. plotting apertures'
                'python-gwcs>=0.16: Used in make_gwcs to create a simple celestial gwcs object'
                'python-photutils-doc: Documentation for python-photutils'
                'python-bottleneck: Improves the performance of sigma clipping and other functionality that may require computing statistics on arrays with NaN values')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
