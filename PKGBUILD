# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-myst-nb
_pname=${pkgbase#python-}
_pyname=MyST-NB
#_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=1.3.0
pkgrel=1
pkgdesc="Parse and execute ipynb files in Sphinx"
arch=('any')
url="https://myst-nb.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-flit-core'
             'python-build'
             'python-installer')
#            'python-sphinx-copybutton'
#            'python-sphinx_design'
#            'python-sphinx-book-theme'
#            'python-myst-parser'
#            'python-jupyter-cache'
#            'ipython'
#            'jupyter-nbformat')    # needs coconut
checkdepends=('python-pytest-param-files'
              'python-pytest-regressions'
#             'python-pytest-xdist'
              'python-beautifulsoup4'
              'python-ipywidgets'
              'python-jupyter-cache'
              'python-matplotlib'
              'python-myst-parser'
              'python-nbdime'
              'python-pandas'
              'python-sphinx'
              'python-sympy'
              'jupyter-nbconvert'
              'python-jupytext')   #    'python-importlib-metadata' <- jupyter...
#checkdepends=('python-nose' 'python-myst-parser' 'python-jupyter-cache' 'ipython')
# nbformat importlib-metadata <- jupyter-cache
#checkdepends=('python-jupyter-sphinx' 'python-jupyter-cache' 'jupyter-nbconvert' 'python-yaml' 'python-sphinx-togglebutton')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/executablebooks/MyST-NB/archive/refs/tags/v${pkgver}.tar.gz")
#       'Makefile')
md5sums=('d2825a4ccf6d7b9b5385632c8ffca651')

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
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#   PYTHONPATH="dist/lib:${PYTHONPATH}" pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#       --deselect=tests/test_execute.py::test_custom_convert_auto \
#       --deselect=tests/test_execute.py::test_custom_convert_cache
}

package_python-myst-nb() {
    depends=('python-importlib-metadata'
             'ipython'
             'python-jupyter-cache>=0.5'
#            'python-jupyter-sphinx'
             'python-myst-parser>=1.0.0'
             'jupyter-nbclient'     # depends on nbformat
             'python-sphinx>=5'
             'python-yaml'
             'python-typing_extensions'
             'python-ipykernel')
    optdepends=('pre-commit: code_style'
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
                'python-sympy: rtd'
                'python-sphinx-autodoc-typehints: rtd')
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
