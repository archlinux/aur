# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-celerite
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4.2
pkgrel=1
pkgdesc="Scalable 1D Gaussian Processes"
arch=('i686' 'x86_64')
url="https://celerite.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'pybind11'
             'python-breathe'
             'python-sphinx_rtd_theme'
             'doxygen'
             'python-numpy')
checkdepends=('python-pytest')  # python-numpy
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('17ab6df03e11fd4c2d91e909613dd4b2')

get_pyver() {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/s/, \"oldest-supported-numpy\"//" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-$(get_pyver)" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-$(get_pyver)" pytest || warning "Tests failed"
}

package_python-celerite() {
    depends=('python>=3.6' 'python-numpy' 'pybind11')
    optdepends=('python-autograd: For computing gradients in celerite models'
                'python-celerite-doc: Documentation for celerite')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-celerite-doc() {
    pkgdesc="Documentation for Python celerite"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
