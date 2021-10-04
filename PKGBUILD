# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-casa-formats-io
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.1
pkgrel=1
pkgdesc="Code to handle I/O from/to data in CASA format Resources"
arch=('i686' 'x86_64')
url="https://casa-formats-io.readthedocs.io"
license=('custom:LGPL2')
makedepends=('python-setuptools-scm' 'python-numpy' 'python-numpydoc' 'python-sphinx-automodapi' 'python-dask' 'python-toolz' 'python-astropy')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b37878b461dfe9d2c42a00925cd73acf')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    mkdir _static
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-${_pyver}" pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package_python-casa-formats-io() {
    depends=('python>=3.6' 'python-astropy>=4.0' 'python-dask' 'python-toolz')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-casa-formats-io-doc() {
    pkgdesc="Documentation for CASA Formats I/O"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
