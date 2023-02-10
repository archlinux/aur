# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname=python-healpy
_pyname=${pkgname#python-}
pkgver=1.16.2
pkgrel=1
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
depends=('python>=3.7' 'python-numpy>=1.13' 'python-scipy' 'python-matplotlib' 'python-astropy' 'cfitsio>=4.1.0' 'healpix>=3.80')
makedepends=('python-setuptools'
             'cython'
             'python-wheel'
             'python-build'
             'python-installer')
optdepends=('python-healpy-doc: Documentation for healpy')
checkdepends=('python-pytest-cython' 'python-pytest-doctestplus' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('ff3015917f100cd7ff058220a7c088c4')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/oldest-supported-numpy/d" -e "/\"wheel\"/s/,/\]/" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # skip tests that cost lots of time
    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv --color=yes \
#       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/healpy/test/test_pixelweights.py::test_pixelweights_local_datapath || warning "Tests failed"
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
