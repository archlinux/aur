# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-myst-nb
#_pyname=${pkgbase#python-}
_pname=${pkgbase#python-}
_pyname=MyST-NB
pkgname=("python-${_pname}")
pkgver=0.17.2
pkgrel=1
pkgdesc="Parse and execute ipynb files in Sphinx"
arch=('any')
url="https://myst-nb.readthedocs.io"
license=('BSD')
makedepends=('python-flit-core'
             'python-build'
             'python-installer')
#            'python-sphinx-copybutton'
#            'python-sphinx_design'
#            'python-sphinx-book-theme'
#            'python-myst-parser<0.19'
#            'python-jupyter-cache'
#            'ipython'
#            'jupyter-nbformat')    # needs coconut
checkdepends=('python-pytest-param-files'
              'python-pytest-regressions'
              'python-beautifulsoup4'
              'python-importlib-metadata'
              'python-ipywidgets'
              'python-jupyter-cache'
              'python-matplotlib'
              'python-myst-parser<0.19'
              'python-nbdime'
              'python-pandas'
              'python-sphinx'
              'python-sympy'
              'jupyter-nbconvert'
              'python-jupytext')
#checkdepends=('python-nose' 'python-myst-parser' 'python-jupyter-cache' 'ipython')
# nbformat importlib-metadata <- jupyter-cache
#checkdepends=('python-jupyter-sphinx' 'python-jupyter-cache' 'jupyter-nbconvert' 'python-yaml' 'python-sphinx-togglebutton')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/executablebooks/MyST-NB/archive/refs/tags/v${pkgver}.tar.gz")
#       'Makefile')
md5sums=('eabb0ca11ec2a7e161ebb001ec88439f')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    ln -s ${srcdir}/Makefile docs
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib:${PYTHONPATH}" pytest || warning "Tests failed" # -vv --color=yes
#       --deselect=tests/test_execute.py::test_custom_convert_auto \
#       --deselect=tests/test_execute.py::test_custom_convert_cache
}

package_python-myst-nb() {
    depends=('python-importlib-metadata'
             'ipython'
             'python-jupyter-cache>=0.5'
#            'python-jupyter-sphinx'
             'python-myst-parser<0.19'
             'jupyter-nbclient'     # depends on nbformat
             'python-sphinx'
             'python-yaml'
             'python-typing_extensions'
             'python-ipykernel')
    optdepends=('python-pre-commit: code_style'
                'python-alabaster: rtd'
                'python-altair: rtd'
                'python-bokeh: rtd'
                'coconut-lang: rtd'
                'python-jupytext: rtd'
                'python-matplotlib: rtd'
                'python-numpy: rtd'
                'python-pandas: rtd'
                'python-plotly: rtd'
                'python-sphinx-book-theme: rtd'
                'python-sphinx-copybutton: rtd'
                'python-sphinx-panels: rtd'
                'python-sphinx_design: rtd'
                'python-sphinxcontrib-bibtex: rtd'
                'python-sympy: rtd')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-tabs-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
