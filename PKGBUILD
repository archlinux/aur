# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regions
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.7
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'cython'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-extension-helpers'
             'python-sphinx-astropy'
             'python-astropy'
             'python-shapely')
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-matplotlib') # astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('889f4492283b85374cf219222f0afb8a')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
}

build() {
    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv --color=yes
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
