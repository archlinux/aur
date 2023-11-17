# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regions
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.8
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm>=6.2'
             'cython<3.1.0'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-extension-helpers'
             'python-sphinx-astropy'
             'python-astropy'
             'python-shapely')
checkdepends=('python-pytest-arraydiff'
              'python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-pytest-remotedata'
              'python-matplotlib') # astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6f1171d99c860623a3ff131c985c9557')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-regions() {
    depends=('python>=3.9' 'python-numpy>=1.22' 'python-astropy>=5.0')
    optdepends=('python-matplotlib>=3.5: Plotting support'
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
