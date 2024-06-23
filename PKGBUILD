# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-celerite
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4.3
pkgrel=1
pkgdesc="Scalable 1D Gaussian Processes"
arch=('i686' 'x86_64')
url="https://celerite.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'pybind11>=2.4'
             'python-numpy'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'python-breathe'
             'doxygen')
checkdepends=('python-pytest')  # python-numpy
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('130fa89192eae7efbff48f4737016a04')

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

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-celerite() {
    depends=('python>=3.9' 'python-numpy' 'pybind11')
    optdepends=('python-autograd: For computing gradients in celerite models'
                'python-celerite-doc: Documentation for celerite')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-celerite-doc() {
    pkgdesc="Documentation for Python celerite"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
