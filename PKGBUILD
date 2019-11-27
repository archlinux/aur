# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-click
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=2.3.1
pkgrel=1
pkgdesc="Sphinx extension that automatically documents click applications"
arch=('i686' 'x86_64')
url="https://sphinx-click.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx')
#checkdepends=('python-coverage' 'python2-coverage' 'python2-sphinx' 'python-click' 'python2-click')
checkdepends=('python-pytest' 'python2-pytest' 'python2-sphinx' 'python-click' 'python2-click')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a3d1b7af95a2284d71bee6d9b513acf1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

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
#   python setup.py test
    pytest

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
    pytest2
}

package_python2-sphinx-click() {
    depends=('python2-sphinx>=1.5' 'python2-pbr>=2.0')
    optdepends=('python-sphinx-click-doc: Documentation for sphinx-click')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-click() {
    depends=('python-sphinx>=1.5' 'python-pbr>=2.0')
    optdepends=('python-sphinx-click-doc: Documentation for sphinx-click')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-click-doc() {
    pkgdesc="Documentation for sphinx-click"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
