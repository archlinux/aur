# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-tweakwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.8.3
pkgrel=1
pkgdesc="A package for correcting alignment errors in WCS objects"
arch=('any')
url="https://tweakwcs.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-gwcs'
              'python-spherical_geometry'
              'python-stsci.stimage')
# 'python-codecov'-cov 'python-stsci.imagestats'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f8855b8e6528d592bfaa90478c0c715a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-tweakwcs() {
    depends=('python>=3.5' 'python-astropy>=5.0.4' 'python-gwcs>=0.14.0' 'python-spherical_geometry>=1.2.20' 'python-stsci.imagestats' 'python-stsci.stimage' 'python-packaging>=19.0')
    optdepends=('python-tweakwcs-doc: Documentation for tweakwcs')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
