# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pytest-qt
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=3.2.2
pkgrel=1
pkgdesc="Pytest plugin for Qt (PyQt4, PyQt5 and PySide) application testing"
arch=('i686' 'x86_64')
url="https://pytest-qt.readthedocs.io/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx')
checkdepends=('python-pytest' 'python2-pytest' 'python-pyqt5' 'python2-pyqt5')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'correct_underline.patch')
md5sums=('f35eee66fdfee776dd4523ab09c2da73'
         '0273d3ad485751e5e61f49f914f86b5e')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/correct_underline.patch"
    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-pytest-qt() {
    depends=('python2-pytest>=2.7')
    optdepends=('python-pytest-qt-doc: Documentation for pytest-qt')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-pytest-qt() {
    depends=('python-pytest>=2.7')
    optdepends=('python-pytest-qt-doc: Documentation for pytest-qt')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-pytest-qt-doc() {
    pkgdesc="Documentation for pytest qt plugin"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
