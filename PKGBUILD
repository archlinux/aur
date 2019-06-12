# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pyvo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.9.2
pkgrel=1
pkgdesc="Astropy affiliated package for accessing Virtual Observatory data and services"
arch=('i686' 'x86_64')
url="https://pyvo.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-astropy' 'python-astropy-helpers>=3.1' 'python2-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python2-pytest<3.7'
#             'python-pytest-astropy'
              'python2-astropy'
              'python2-contextlib2'
#             'python-requests-mock'
              'python2-requests-mock')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('16e6a11a0ab10b55ed4729df59911efc')

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

    msg "Building Docs"
    python setup.py build_docs
}

check() {
#   msg "Checking Python3"
#   cd ${srcdir}/${_pyname}-${pkgver}
#   python setup.py test

#   msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-pyvo() {
    depends=('python2-numpy' 'python2-astropy' 'python2-requests')
    optdepends=('python-pyvo-doc: Documentation for PyVO')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/ex_casA_image_cat.py ${pkgdir}/usr/bin/ex_casA_image_cat2.py
    mv ${pkgdir}/usr/bin/ex_get_cutouts.py ${pkgdir}/usr/bin/ex_get_cutouts2.py
}

package_python-pyvo() {
    depends=('python-numpy' 'python-astropy' 'python-requests')
    optdepends=('python-pyvo-doc: Documentation for PyVO'
                'python-pytest-astropy: For testing'
                'python-astropy<3.2: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pyvo-doc() {
    pkgdesc="Documentation for Python PyVO module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
