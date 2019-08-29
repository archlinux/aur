# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.image
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=2.3.3
pkgrel=3
pkgdesc="Image array manipulation functions"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stsci.image"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy')
checkdepends=('python2-scipy')
#             'python-scipy'
#             'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4dc542e40f5c9b4a79e51855e055ee00')
_pyver=$(python -V | cut -c 8-10)

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
}

check() {
#   msg "Checking Python3"
#   cd ${srcdir}/${_pyname}-${pkgver}
#   python setup.py test
#   pytest

#   msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-stsci.image() {
    depends=('python2-numpy>=1.13' 'python2-scipy' 'python2-stsci.tools')
    optdepends=('python-stsci.image-doc: Documentation for STScI Image')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python2.7/site-packages/stsci"/__init__.py*
}

package_python-stsci.image() {
    depends=('python-numpy>=1.13' 'python-scipy' 'python-stsci.tools')
    optdepends=('python-stsci.image-doc: Documentation for STScI Image')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__pycache__"/*
}
