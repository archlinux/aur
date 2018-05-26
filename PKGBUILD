# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-gwcs
pkgname=('python2-gwcs' 'python2-gwcs-doc')
pkgver=0.8.0
pkgrel=3
pkgdesc="A python package for managing the World Coordinate System (WCS) of astronomical data"
arch=('i686' 'x86_64')
url="http://gwcs.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython2' 'python2-astropy-helpers' 'python2-sphinx' 'python2-matplotlib')
checkdepends=('python2-pytest' 'python2-astropy' 'python2-asdf')
source=("https://files.pythonhosted.org/packages/source/g/gwcs/gwcs-${pkgver}.tar.gz")
md5sums=('8c4bc796ae1bfe9a3983c0cc7bde7727')

prepare() {
    cd ${srcdir}/gwcs-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build () {
    cd ${srcdir}/gwcs-${pkgver}
    python2 setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python2 setup.py build_docs
}

check(){
    cd ${srcdir}/gwcs-${pkgver}
    python2 setup.py test
}

package_python2-gwcs() {
    depends=('python2' 'python2-numpy>=1.7' 'python2-astropy>=1.2' 'python2-asdf')
    optdepends=('python2-gwcs-doc: Documentation for Python-GWCS')
    cd ${srcdir}/gwcs-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python2-gwcs-doc() {
    pkgdesc="Documentation for Python GWCS module"
    cd ${srcdir}/gwcs-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
