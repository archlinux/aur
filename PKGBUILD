# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-roman-datamodels
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.20.0
pkgrel=1
pkgdesc="Datamodel support for the roman calibration pipeline"
arch=('any')
url="https://roman-datamodels.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinxcontrib-jquery'
             'python-sphinx_rtd_theme'
             'python-pytest-doctestplus'
             'python-rad'
             'graphviz')
checkdepends=('python-pytest-doctestplus'
              'python-pytest-env'
              'python-pytest-xdist'
              'python-gwcs') # rad already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3a18fa9cb33234fe80bfef1f9ab2728e')

get_pyver() {
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

    ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-roman-datamodels() {
    depends=('python>=3.10' 'python-asdf-astropy>=0.5.0' 'python-gwcs>=0.18.1' 'python-rad>=0.20.0')
    optdepends=('python-roman-datamodels-doc: Documentation for Roman Datamodels')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-roman-datamodels-doc() {
    pkgdesc="Documentation for Python Roman Datamodels"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
