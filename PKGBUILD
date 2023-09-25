# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=0.15.1
pkgrel=2
arch=(any)
url="https://${_base/-/}.org"
license=('custom:BSD-3-clause')
depends=(python-click
  python-docutils
  python-jinja
  python-jsonschema
  python-linkify-it-py
  python-myst-nb
  python-yaml
  python-sphinx-comments
  python-sphinx-copybutton
  python-sphinx-external-toc
  python-sphinx-jupyterbook-latex
  python-sphinx-design
  python-sphinx-thebe
  python-sphinx-book-theme
  python-sphinx-togglebutton
  python-sphinxcontrib-bibtex
  python-sphinx-multitoc-numbering)
makedepends=(python-build python-installer python-flit-core)
checkdepends=(python-pytest python-jupytext python-ruamel-yaml python-texsoup)
source=(${_base}-${pkgver}.tar.gz::https://github.com/executablebooks/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('0ce0f8edc6840fa09677a53b407d66da94cfc9efc857652bf1810f601a88d10d30cd147c81b131a560b57d31bc4ab7e4c2fc7ae12aee10eff279cfc83265ecfc')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_build.py \
    --ignore=tests/test_clean.py \
    --ignore=tests/test_config.py \
    --ignore=tests/test_pdf.py \
    --ignore=tests/test_sphinx_multitoc_numbering.py \
    --ignore=tests/test_tocdirective.py \
    -k 'not toc'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
