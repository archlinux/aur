# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ci_watson
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.10.0
pkgrel=1
pkgdesc="CI helper for STScI Jenkins"
arch=('any')
url="https://ci_watson.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-copybutton'
             'python-sphinx_design'
             'python-pydata-sphinx-theme'
             'python-numpydoc'
             'python-crds'
             'python-pytest'
             'python-readchar'
             'python-colorama')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header') # crds already in makedepends
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('ee5eb6ee629bcb3824f684f15cca23ec')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    python -m installer --destdir=tmp_install dist/*.whl
    cp -r ${_pyname}/scripts tmp_install/$(get_pyinfo site)/${_pyname}
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PATH="${srcdir}/${_pyname}-${pkgver}/tmp_install/usr/bin:${PATH}" \
        PYTHONPATH="${srcdir}/${_pyname}-${pkgver}/tmp_install/$(get_pyinfo site)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    # Variable needs for inputs_root
#   PYTHONPATH="build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
    PYTHONPATH="${srcdir}/${_pyname}-${pkgver}/tmp_install/$(get_pyinfo site)" \
        pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-ci_watson() {
    depends=('python>=3.9' 'python-pytest>=6' 'python-crds' 'python-readchar>=3.0' 'python-colorama>=0.4.1') # requests <- crds
    optdepends=('python-astropy>=6'
                'python-ci_watson-doc: Documentation for CI Watson')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    cp -a ${_pyname}/scripts ${pkgdir}/$(get_pyinfo site)/${_pyname}
}

package_python-ci_watson-doc() {
    pkgdesc="Documentation for CI Watson"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
