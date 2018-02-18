# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-naima
pkgname=('python-naima' 'python2-naima' 'python-naima-doc')
pkgver=0.8.1
pkgrel=1
pkgdesc="Derivation of non-thermal particle distributions through MCMC spectral fitting"
arch=('i686' 'x86_64')
url="https://naima.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx' 'python-matplotlib' 'python-emcee')
#checkdepends=('python-pytest-astropy' 'python2-pytest' 'python2-astropy' 'python-corner' 'python2-corner' 'python-emcee' 'python2-emcee')
source=("https://files.pythonhosted.org/packages/source/n/naima/naima-${pkgver}.tar.gz")
md5sums=('79e5e5135b6d31c97b63a032b32a13c7')

prepare() {
    cd ${srcdir}/naima-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/naima-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/naima-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/naima-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd ${srcdir}/naima-${pkgver}
#    python setup.py test
#
#    cd ${srcdir}/naima-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-naima() {
    depends=('python2' 'python2-scipy' 'python2-matplotlib' 'python2-astropy>=1.0.2' 'python2-emcee>=2.2.0' 'python2-corner')
    optdepends=('python2-sherpa'
                'python2-pytest: For testing'
                'python-naima-doc: Documentation for Naima')
    cd ${srcdir}/naima-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-naima() {
    depends=('python' 'python-scipy' 'python-matplotlib' 'python-astropy>=1.0.2' 'python-emcee>=2.2.0' 'python-corner')
    optdepends=('python-pytest-astropy: For testing'
                'python-naima-doc: Documentation for Naima')
    cd ${srcdir}/naima-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-naima-doc() {
    pkgdesc="Documentation for Python Naima module"
    cd ${srcdir}/naima-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
