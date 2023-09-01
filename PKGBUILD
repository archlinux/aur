# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ci_watson
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6.2
pkgrel=1
pkgdesc="CI helper for STScI Jenkins"
arch=('any')
url="https://ci_watson.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx_rtd_theme'
             'python-numpydoc'
             'python-sphinx-automodapi'
             'python-crds'
             'python-pytest')
checkdepends=('python-pytest-astropy-header') # crds already in makedepends
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('955fb8015bd126f0daaaa971d8f96a9e')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-ci_watson() {
    depends=('python>=3.9' 'python-pytest>=3' 'python-crds') # requests <- crds
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
