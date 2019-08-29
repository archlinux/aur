# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.skypac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.4
pkgrel=1
pkgdesc="Sky matching for image mosaic"
arch=('i686' 'x86_64')
url="https://stsci-skypac.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-relic' 'python-spherical_geometry' 'python-stsci.tools' 'python-stwcs' 'python-stsci.imagestats' 'python-numpydoc' 'python-sphinx_rtd_theme' 'python-stsci_rtd_theme')
#checkdepends=('python-pytest')
source=("https://github.com/spacetelescope/stsci.skypac/archive/${pkgver}.tar.gz")
md5sums=('ef209b3328e4009d59fbcd766e2ef540')
_pyver=$(python -V | cut -c 8-10)

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package_python-stsci.skypac() {
    depends=('python>=3.5' 'python-astropy>=3.1' 'python-spherical_geometry' 'python-stwcs' 'python-stsci.imagestats')
    optdepends=('python-stsci.skypac-doc: Documentation for STScI skypac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__pycache__"/*
}

package_python-stsci.skypac-doc() {
    pkgdesc="Documentation for STScI skypac"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
