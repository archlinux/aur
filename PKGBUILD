# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-baseband
pkgname=('python-baseband' 'python2-baseband')
#'python-baseband-doc')
pkgver=2.0.0
pkgrel=1
pkgdesc="Package to read and write radio baseband data"
arch=('i686' 'x86_64')
url="https://baseband.readthedocs.io/en/stable/"
license=('GPL')
makedepends=('python' 'python2')
checkdepends=('python-astropy' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/b/baseband/baseband-${pkgver}.tar.gz")
md5sums=('38cd15701a5951166000acdc72f4b997')

prepare() {
    cd ${srcdir}/baseband-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/baseband-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/baseband-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/baseband-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
    cd ${srcdir}/baseband-${pkgver}
    python setup.py test

#   cd ${srcdir}/baseband-${pkgver}-py2
#   python2 setup.py test
}

package_python2-baseband() {
    depends=('python2-numpy>=1.9' 'python2-astropy>=2.0')
    optdepends=('python2-pytest<3.7: For testing')
#               'python-baseband-doc: Documentation for Baseband')
    cd ${srcdir}/baseband-${pkgver}-py2

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/astropy-package-template-example{,2}
}

package_python-baseband() {
    depends=('python-numpy>=1.9' 'python-astropy>=2.0')
#   optdepends=('python-baseband-doc: Documentation for Baseband')
    cd ${srcdir}/baseband-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-baseband-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/baseband-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
