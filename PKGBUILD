# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pyvo
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.1
pkgrel=1
pkgdesc="Astropy affiliated package for accessing Virtual Observatory data and services"
arch=('i686' 'x86_64')
url="https://pyvo.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-mimeparse' 'python-astropy' 'python-astropy-helpers>=3.2.1' 'python-sphinx-astropy' 'graphviz')
checkdepends=('python-pytest-astropy' 'python-requests-mock')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('aecd59fcd662664d9edbd4319cb54e62')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    sed -i -e 's/mimeparse/python-mimeparse/' setup.cfg
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

package_python-pyvo() {
    depends=('python-astropy' 'python-requests' 'python-mimeparse')
    optdepends=('python-pyvo-doc: Documentation for PyVO')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pyvo-doc() {
    pkgdesc="Documentation for Python PyVO module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
