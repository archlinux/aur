# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-photutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.7.2
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io/"
license=('BSD')
makedepends=('cython>=0.28'
             'python-astropy'
             'python-astropy-helpers'
             'python-scikit-learn'
             'python-scikit-image'
             'python-sphinx-astropy'
             'graphviz')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7f60e260f1c7d3a12efc401bc29fd4bb')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-photutils() {
    depends=('python>=3.5' 'python-numpy>=1.13' 'python-astropy>=2.0')
    optdepends=('python-scipy>=0.19: To power a variety of features in several modules (strongly recommended)'
                'python-scikit-image>=0.14.2: Used in deblend_sources for deblending segmented sources'
                'python-scikit-learn>=0.19:  Used in DBSCANGroup to create star groups'
                'python-matplotlib>=2.2: To power a variety of plotting features (e.g. plotting apertures'
                'python-gwcs>=0.11: Used in make_gwcs to create a simple celestial gwcs object'
                'python-photutils-doc: Documentation for python-photutils')
#               'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
