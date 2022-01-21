# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-healpy
_pyname=${pkgname#python-}
pkgver=1.15.1
pkgrel=1
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
depends=('python>=3.7' 'python-numpy>=1.13' 'python-scipy' 'python-matplotlib' 'python-astropy' 'cfitsio' 'healpix>=3.80')
makedepends=('cython')
optdepends=('python-healpy-doc: Documentation for healpy')
checkdepends=('python-pytest-cython' 'python-pytest-doctestplus' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('d677ca493bd7694850028ce559443e9e')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i 's/3.80.0/3.80/' setup.py
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

package() {
    cd ${srcdir}/healpy-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
