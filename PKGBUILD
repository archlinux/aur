# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.stimage
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.5
pkgrel=1
pkgdesc="STScI image processing"
arch=('i686' 'x86_64')
url="https://stscistimage.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-numpy')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('88cd348d05fa525c7ae8fbdde8ea62c7')

prepare() {
   export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package_python-stsci.stimage() {
    depends=('python-numpy>=1.14')
    optdepends=('python-stsci.stimage-doc: Documentation for STScI STImage')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
