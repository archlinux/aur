# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-poliastro
_pyname=${pkgname#python-}
pkgver=0.17.0
pkgrel=1
pkgdesc="Astrodynamics and Orbital Mechanics computations"
arch=('any')
url="http://docs.poliastro.space"
license=('MIT')
makedepends=('python-flit-core' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-doctestplus'
              'python-astroquery'
              'python-scipy'
#             'python-hypothesis'
#             'python-pandas'
#             'jupyter-nbformat'
#             'python-matplotlib'
#             'python-retrying'
#             'python-pyrsistent'
              'python-plotly'
#             'python-jplephem'
              'python-czml3'
              'python-numba>0.55.2'
              'python-llvmlite>=0.39.0')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2b65a26daf429e50ba9613999b592644')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    # needs numba-git (>0.55.2) and llvmlite-git (>=0.39.0)
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest "dist/lib" || warning "Tests failed"
#   pytest #|| warning "Tests failed"
}

package() {
    depends=('python-scipy>=1.4.0' 'python-astroquery>=0.3.9"' 'python-jplephem' 'python-matplotlib>3.0.1' 'python-plotly<6' 'python-numba>0.55.1' 'python-pyerfa' 'python-pandas')
    optdepends=('python-poliastro-doc: Documentation for poliastro'
                'python-pytest: For running the tests from the package')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
