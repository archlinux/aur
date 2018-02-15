# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-photutils
pkgname=('python-photutils' 'python2-photutils' 'python-photutils-doc')
pkgver=0.4
pkgrel=1
pkgdesc="Astropy Affiliated package for image photometry utilities"
arch=('i686' 'x86_64')
url="http://photutils.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-numpy' 'python2-numpy' 'python-astropy' 'python-scikit-learn' 'python-scikit-image' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx' 'python-matplotlib')
#checkdepends=('python-pytest-astropy' 'python2-pytest' 'python2-astropy')
source=("https://files.pythonhosted.org/packages/source/p/photutils/photutils-${pkgver}.tar.gz")
md5sums=('ce5ff436d0d8d394bfa6648009f14d37')

prepare() {
    cd ${srcdir}/photutils-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/photutils-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/photutils-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/photutils-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd $srcdir/photutils-${pkgver}
#    python setup.py test
#
#    cd $srcdir/photutils-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-photutils() {
    depends=('python2>=2.7' 'python2-numpy>=1.9' 'python2-astropy>=2.0' 'python2-six')
    optdepends=('python2-scipy>=0.16: For full functionality'
                'python2-scikit-image>=0.11: For full functionality'
                'python2-scikit-learn>=0.18: For full functionality'
                'python2-matplotlib>=1.3: For full functionality'
                'python2-pytest: For testing'
                'python-photutils-doc: Documentation for python-photutils')
    cd ${srcdir}/photutils-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-photutils() {
    depends=('python>=3.4' 'python-numpy>=1.9' 'python-astropy>=2.0' 'python-six')
    optdepends=('python-scipy>=0.16: For full functionality'
                'python-scikit-image>=0.11: For full functionality'
                'python-scikit-learn>=0.18: For full functionality'
                'python-matplotlib>=1.3: For full functionality'
                'python-pytest-astropy: For testing'
                'python-photutils-doc: Documentation for python-photutils')
    cd ${srcdir}/photutils-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-photutils-doc() {
    pkgdesc="Documentation for Python Photutils module"
    cd ${srcdir}/photutils-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
