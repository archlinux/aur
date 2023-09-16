# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-gwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.19.0
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
              'python-typeguard')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b55db0e0f7627aa4ea82c6f7668b697f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-gwcs() {
    depends=('python>=3.9' 'python-scipy' 'python-astropy>=5.3' 'python-asdf>=2.8.1' 'python-asdf_wcs_schemas' 'python-asdf-astropy>=0.2.0')
    optdepends=('python-gwcs-doc: Documentation for Python-GWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
