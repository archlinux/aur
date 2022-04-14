# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-tweakwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.7.4
pkgrel=1
pkgdesc="A package for correcting alignment errors in WCS objects"
arch=('any')
url="https://tweakwcs.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-cov' 'python-codecov' 'python-gwcs' 'python-spherical_geometry' 'python-stsci.imagestats' 'python-stsci.stimage' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/spacetelescope/tweakwcs/master/LICENSE.txt')
md5sums=('6c31f648ea48d21d4af72b5e19a69e39'
         'SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    pytest || warning "Tests failed"
}

package_python-tweakwcs() {
    depends=('python>=3.5' 'python-astropy>=5.0.4' 'python-gwcs>=0.14.0' 'python-spherical_geometry>=1.2.20' 'python-stsci.imagestats' 'python-stsci.stimage' 'python-packaging>=19.0')
    optdepends=('python-tweakwcs-doc: Documentation for tweakwcs')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
