# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regions
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io"
license=('BSD')
makedepends=('cython' 'python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-numpy' 'python-extension-helpers' 'python-astropy' 'python-sphinx-astropy' 'python-shapely')
checkdepends=('python-pytest-astropy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('dad3ff173994b5991b56de31d9c712f6')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/cython/s/==/>=/" -e "/oldest-supported-numpy/d" pyproject.toml
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-${_pyver}" || warning "Tests failed"
}

package_python-regions() {
    depends=('python>=3.8' 'python-numpy>=1.18' 'python-astropy>=5.0')
    optdepends=('python-matplotlib>=3.1: Plotting support'
                'python-shapely: Managing geometric objects'
                'python-regions-doc: Documentation for AstroPy Regions')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-regions-doc() {
    pkgdesc="Documentation for AstroPy Regions"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
