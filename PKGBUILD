# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.18.0
pkgrel=1
pkgdesc="A python package for managing the World Coordinate System (WCS) of astronomical data"
arch=('any')
url="http://gwcs.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-doctestplus'
              'python-scipy'
              'python-asdf-astropy'
              'python-asdf_wcs_schemas'
              'python-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('66894e862baf93737ade29415e77236d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest || warning "Tests failed"
}

package_python-gwcs() {
    depends=('python>=3.6' 'python-scipy' 'python-astropy>=4.1' 'python-asdf>=2.8.1' 'python-asdf_wcs_schemas' 'python-asdf-astropy')
    optdepends=('python-gwcs-doc: Documentation for Python-GWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
