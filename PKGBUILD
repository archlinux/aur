# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-reproject
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.7
pkgrel=1
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io"
license=('BSD')
makedepends=('cython' 'python-setuptools-scm' 'python-extension-helpers' 'python-sphinx-astropy' 'python-astropy-healpix' 'python-pyvo' 'python-mimeparse')
checkdepends=('python-shapely' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ff2821e83ac2d68a8fecdee1ebcc2d45')
_pyver=$(python -V | cut -c 8-10)

prepare() {
    export _pyver=$(python -V | cut -c 8-10)
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}/build/lib.linux-${CARCH}-${_pyver}

    PYTHONPATH="build/lib.linux-${CARCH}-${_pyver}" pytest
}

package_python-reproject() {
    depends=('python>=3.6' 'python-numpy>=1.13' 'python-scipy>=0.9' 'python-astropy>=3.2' 'python-astropy-healpix>=0.2')
    optdepends=('python-shapely>=1.6: For some of the mosaicking functionality'
                'python-reproject-doc: Documentation for Reproject'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-reproject-doc() {
    pkgdesc="Documentation for Python Reproject module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
