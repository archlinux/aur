# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-baseband
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}" "python2-${_pyname}-doc")
pkgver=2.0.0
pkgrel=1
pkgdesc="Package to read and write radio baseband data"
arch=('i686' 'x86_64')
url="https://baseband.readthedocs.io/"
license=('GPL')
makedepends=('python2' 'python2-astropy' 'python2-astropy-helpers' 'python2-sphinx' 'python2-matplotlib')
#checkdepends=('python2-pytest32')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('38cd15701a5951166000acdc72f4b997')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python2 setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python2 setup.py build_docs
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}

#    python2 setup.py test
#}

package_python2-baseband() {
    depends=('python2-numpy>=1.9' 'python2-astropy>=2.0')
    optdepends=('python2-pytest<3.7: For testing'
                'python2-baseband-doc: Documentation for Baseband')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/astropy-package-template-example{,2}
}

package_python2-baseband-doc() {
    pkgdesc="Documentation for Python Baseband"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
