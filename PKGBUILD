# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gwcs
pkgname=('python-gwcs' 'python-gwcs-doc')
pkgver=0.9.1
pkgrel=1
pkgdesc="A python package for managing the World Coordinate System (WCS) of astronomical data"
arch=('i686' 'x86_64')
url="http://gwcs.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'python-astropy' 'python-astropy-helpers' 'python-sphinx' 'python-matplotlib')
checkdepends=('python-asdf' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/g/gwcs/gwcs-${pkgver}.tar.gz")
md5sums=('87d9f0aa1a7434da10f4ee3bd3dae201')

prepare() {
    cd ${srcdir}/gwcs-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build () {
    cd ${srcdir}/gwcs-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check(){
    cd ${srcdir}/gwcs-${pkgver}
    python setup.py test
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
