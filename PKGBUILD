# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-notfound-page
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6
pkgrel=1
pkgdesc="Sphinx extension to build a 404 page with absolute URLs"
arch=('i686' 'x86_64')
url="https://sphinx-notfound-page.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools'
             'python-sphinx-autoapi'
             'python-sphinx-tabs'
             'python-sphinx-prompt'
             'python-sphinxemoji'
             'python-sphinx_rtd_theme')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('40b6448e145a9241afca7ce65ca5a58d')

prepare() {
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
    cd ${srcdir}/${_pyname}-${pkgver}
    msg "Checking Python3"
#   python setup.py test
    pytest || warning "Tests failed"

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-sphinx-notfound-page() {
    depends=('python2>=2.7')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-notfound-page() {
    depends=('python-sphinx>=2')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-notfound-page-doc() {
    pkgdesc="Documentation for Sphinx-Gallery extension"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
