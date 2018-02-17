# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-specutils
pkgname=('python-specutils' 'python2-specutils')
#'python-specutils-doc')
pkgver=0.2.2
pkgrel=1
pkgdesc="Astropy Affiliated package for 1D spectral operations"
arch=('i686' 'x86_64')
url="http://specutils.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-numpy' 'python2-numpy' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers')
#'python-sphinx' 'python-matplotlib')
checkdepends=('python-pytest-astropy' 'python2-pytest' 'python2-astropy')
source=("https://files.pythonhosted.org/packages/source/s/specutils/specutils-${pkgver}.tar.gz")
md5sums=('00dbf895764ec369d47486aa574c2be9')

prepare() {
    cd ${srcdir}/specutils-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/specutils-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/specutils-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/specutils-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

check(){
    cd $srcdir/specutils-${pkgver}
    python setup.py test

    cd $srcdir/specutils-${pkgver}-py2
    python2 setup.py test
}

package_python2-specutils() {
    depends=('python2' 'python2-astropy')
#   optdepends=('python-specutils-doc: Documentation for Specutils')
    cd ${srcdir}/specutils-${pkgver}-py2

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-specutils() {
    depends=('python' 'python-astropy')
#   optdepends=('python-specutils-doc: Documentation for Specutils')
    cd ${srcdir}/specutils-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-specutils-doc() {
#    pkgdesc="Documentation for Python Specutils module"
#    cd ${srcdir}/specutils-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
