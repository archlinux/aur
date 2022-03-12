# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ci_watson
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6.1
pkgrel=1
pkgdesc="CI helper for STScI Jenkins"
arch=('any')
url="https://ci_watson.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-sphinx_rtd_theme' 'python-numpydoc' 'python-sphinx-automodapi' 'python-crds')
checkdepends=('python-pytest-astropy-header' 'python-astropy')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('bf36328cafcc5aad94d95bb5f7f46fac')

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py${_pyver}.egg-info
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed"
}

package_python-ci_watson() {
    depends=('python>=3.5' 'python-pytest>=3' 'python-crds')
    optdepends=('python-ci_watson-doc: Documentation for CI Watson')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ci_watson-doc() {
    pkgdesc="Documentation for CI Watson"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
