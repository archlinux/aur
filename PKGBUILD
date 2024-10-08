# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=1.0.3
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-click
  python-jinja
  python-jsonschema
  python-linkify-it-py
  python-myst-nb
  python-yaml
  python-sphinx-comments
  python-sphinx-copybutton
  python-sphinx-external-toc
  python-sphinx-jupyterbook-latex
  python-sphinx_design
  python-sphinx-thebe
  python-sphinx-book-theme
  python-sphinx-togglebutton
  python-sphinxcontrib-bibtex
  python-sphinx-multitoc-numbering)
makedepends=(python-build python-installer python-flit-core)
checkdepends=(python-pytest python-jupytext python-texsoup python-cookiecutter
  python-sphinx-inline-tabs python-altair texlive-binextra texlive-xetex
  texlive-latexrecommended texlive-pictures texlive-fontsrecommended
  texlive-fontsextra texlive-latexextra)
source=(${_base}-${pkgver}.tar.gz::https://github.com/executablebooks/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('60740ffbf30988bf16ab037517614239a517b9608a004451dd36e41680909d2b818cc02d07d1fc81de85dda3d3654364613af53abd563a6e3a026fbef9083f42')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=${srcdir}/${_base}-${pkgver}/test-env/bin:$PATH test-env/bin/python -m pytest \
    -k 'not execution_timeout and not toc_numbered[_toc_numbered.yml] and not toc_numbered[_toc_numbered_depth.yml] and not toc_numbered[_toc_numbered_parts.yml] and not toc_numbered[_toc_numbered_parts_subset.yml] and not toc_numbered[_toc_numbered_depth_parts_subset.yml] and not mathjax_config_warning and not mathjax_config_warning_mathjax2path and not toc_parts' \
    --ignore=tests/test_pdf.py \
    --ignore=tests/test_sphinx_multitoc_numbering.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
