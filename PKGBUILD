# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astrocut
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.9
pkgrel=1
pkgdesc="Tools for making image cutouts from sets of TESS full frame images"
arch=('any')
url="https://astrocut.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-sphinx-astropy' 'python-sphinx_rtd_theme' 'python-astropy' 'python-scipy')
#'python-sphinx_rtd_theme' 'python-numpydoc' 'python-sphinx-automodapi')
#checkdepends=('python-pytest-astropy-header' 'python-astropy')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6f7cbc73f9c0e0f08c2442547c7cff0c')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-astrocut() {
    depends=('python>=3.6' 'python-astropy' 'python-scipy' 'python-pillow')
    optdepends=('python-astrocut-doc: Documentation for astrocut')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astrocut-doc() {
    pkgdesc="Documentation for python-astrocut"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
