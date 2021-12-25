# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.image
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.3.5
pkgrel=1
pkgdesc="Image array manipulation functions"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stsci.image"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-numpy')
#'python-stsci.sphinxext')
checkdepends=('python-pytest' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('34f9a03645fcbbe06f8882ff01aa53d3')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package_python-stsci.image() {
    depends=('python-numpy>=1.14' 'python-scipy' 'python-stsci.tools')
    optdepends=('python-stsci.image-doc: Documentation for STScI Image')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__pycache__"/*
}

#package_python-stsci.image-doc() {
#    pkgdesc="Documentation for Python STScI Image"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
