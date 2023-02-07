# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-gwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.18.3
pkgrel=1
pkgdesc="A python package for managing the World Coordinate System (WCS) of astronomical data"
arch=('any')
url="http://gwcs.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-doctestplus'
#             'python-pytest-remotedata'
              'python-scipy'
              'python-asdf-astropy'
              'python-asdf_wcs_schemas'
              'python-astropy'
              'python-typeguard')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f519b89b86c9a8dd2cb95fce81a0b3d7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest || warning "Tests failed" # -vv --color=yes
}

package_python-gwcs() {
    depends=('python>=3.8' 'python-scipy' 'python-astropy>=5.1' 'python-asdf>=2.8.1' 'python-asdf_wcs_schemas' 'python-asdf-astropy>=0.2.0')
    optdepends=('python-gwcs-doc: Documentation for Python-GWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
