# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gwcs
pkgname=('python-gwcs' 'python2-gwcs' 'python-gwcs-doc')
pkgver=0.8.0
pkgrel=2
pkgdesc="A python package for managing the World Coordinate System (WCS) of astronomical data"
arch=('i686' 'x86_64')
url="http://gwcs.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx' 'python-matplotlib')
#checkdepends=('python-pytest' 'python2-pytest' 'python-semantic-version' 'python2-semantic-version' 'python-asdf' 'python2-astropy' 'python2-asdf')
source=("https://files.pythonhosted.org/packages/source/g/gwcs/gwcs-${pkgver}.tar.gz")
md5sums=('8c4bc796ae1bfe9a3983c0cc7bde7727')

prepare() {
    cd ${srcdir}/gwcs-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/gwcs-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/gwcs-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/gwcs-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd $srcdir/gwcs-${pkgver}
#    python setup.py test
#
#    cd $srcdir/gwcs-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-gwcs() {
    depends=('python2' 'python2-numpy>=1.7' 'python2-astropy>=1.2' 'python2-asdf')
    optdepends=('python-gwcs-doc: Documentation for Python-GWCS')
    cd ${srcdir}/gwcs-${pkgver}-py2

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-gwcs() {
    depends=('python' 'python-numpy>=1.7' 'python-astropy>=1.2' 'python-asdf')
    optdepends=('python-gwcs-doc: Documentation for Python-GWCS')
    cd ${srcdir}/gwcs-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-gwcs-doc() {
    pkgdesc="Documentation for Python GWCS module"
    cd ${srcdir}/gwcs-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
