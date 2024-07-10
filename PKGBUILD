# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=1.0.2
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=(BSD-3-Clause)
depends=(python-click python-jinja python-jsonschema python-linkify-it-py python-myst-nb
  python-yaml python-sphinx-comments python-sphinx-copybutton python-sphinx-external-toc
  python-sphinx-jupyterbook-latex python-sphinx_design python-sphinx-thebe python-sphinx-book-theme
  python-sphinx-togglebutton python-sphinxcontrib-bibtex python-sphinx-multitoc-numbering)
makedepends=(python-build python-installer python-flit-core)
checkdepends=(python-pytest python-jupytext python-texsoup)
source=(${_base}-${pkgver}.tar.gz::https://github.com/executablebooks/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('b64efda06d8714c9824970f5d02e529d78989c07ade2f672e5a01a619cc618ae4cb9dfa509a6585fb89c89d96bd7d9d8eca6d22e21f10f9982b80f03148f82ba')

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
    --ignore=tests/test_sphinx_multitoc_numbering.py \
    --ignore=tests/test_tocdirective.py \
    --ignore=tests/test_pdf.py \
    -k 'not toc'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
