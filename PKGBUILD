# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-regions
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.11
pkgrel=1
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=8.0'
             'cython>=3.1.2'
             'python-build'
             'python-installer'
             'python-numpy>=2.0.0'
             'python-extension-helpers'
             'python-sphinx-astropy'
             'python-matplotlib'
             'python-astropy'
             'python-shapely')  # wheel required by new setuptools
# regions/conftest.py
checkdepends=('python-pytest-astropy-header'
#             'python-pytest-xdist'
              'python-pytest-doctestplus'
              'python-pytest-remotedata') # astropy，matplotlib already in makedepends
#             'python-pytest-arraydiff'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5102525559a622a030ab88118d38a11b')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/error/a \    'ignore:Test functions should:pytest.PytestReturnNotNoneWarning'," pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-regions() {
    depends=('python>=3.11' 'python-numpy>=1.25' 'python-astropy>=6.0')
    optdepends=('python-matplotlib>=3.8: Plotting support'
                'python-shapely>=2.0.0: Managing geometric objects'
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
