# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stpipe
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.11.1
pkgrel=1
pkgdesc="Framework for calibration pipeline software"
arch=('any')
url="https://stpipe.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-numpydoc'
             'python-crds'
             'graphviz')  # wheel required by new setuptools
checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-roman-datamodels'
##             'python-jwst'
              'python-stdatamodels')   # crds already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('dfd58192aaf1271c5525d2e871cf91d1')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m installer --destdir=tmp_install dist/*.whl
#   mkdir -p .crds/config/jwst
#   touch .crds/config/jwst/server_config
#   CRDS_PATH=".crds" \
#   CRDS_PATH=".crds" CRDS_SERVER_URL="https://jwst-crds.stsci.edu" \
    PATH="${srcdir}/${_pyname}-${pkgver}/tmp_install/usr/bin:${PATH}" \
        PYTHONPATH="tmp_install/$(get_pyinfo site)" \
        pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-stpipe() {
    depends=('python>=3.10'
             'python-asdf>=2.13'
             'python-crds>=7.4.1.3'
             'python-importlib-metadata>=4.11.4'
             'python-yaml>=5')
    optdepends=('python-stpipe-doc: Documentation for stpipe')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stpipe-doc() {
    pkgdesc="Documentation for Python STPipe"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
