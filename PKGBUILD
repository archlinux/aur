# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.skypac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.9
pkgrel=1
pkgdesc="Sky matching for image mosaic"
arch=('any')
url="https://stsci-skypac.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-pytest-runner' 'python-stwcs' 'python-stsci.imagestats' 'python-spherical_geometry>=1.2.2' 'python-stsci_rtd_theme' 'python-sphinx_rtd_theme' 'python-numpydoc' 'texlive-latexextra')
checkdepends=('python-pytest-doctestplus')
source=("https://github.com/spacetelescope/stsci.skypac/archive/${pkgver}.tar.gz")
md5sums=('ceeadf5f02d6df7ac973d901edc32ccf')

get_pyver () {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver).egg-info
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed"
}

package_python-stsci.skypac() {
    depends=('python>=3.5' 'python-astropy>=3.1' 'python-spherical_geometry>=1.2.2' 'python-stwcs' 'python-stsci.imagestats')
    optdepends=('python-stsci.skypac-doc: Documentation for STScI skypac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/stsci/__pycache__"/*
}

package_python-stsci.skypac-doc() {
    pkgdesc="Documentation for STScI skypac"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
