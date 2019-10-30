# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
pkgbase=python-sbpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.2
pkgrel=1
pkgdesc="A Python package for small bodies research"
arch=('i686' 'x86_64')
url="http://sbpy.readthedocs.io/"
license=('BSD')
makedepends=('python-astropy-helpers' 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6421c7c58dc473974d1aaf11441a6032')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i -e '/[pytest]/s/pytest/tool:pytest/' setup.cfg
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

package_python-sbpy() {
    depends=('python' 'python-numpy' 'python-scipy' 'python-astropy>=1.0' )
    optdepends=('python-sbpy-doc: Documentation for sbpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-sbpy-doc() {
    pkgdesc="Documentation for Python sbpy module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
