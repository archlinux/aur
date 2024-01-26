# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=jupyter-book
pkgname=python-${_base}
pkgdesc="Build a book with Jupyter Notebooks and Sphinx"
pkgver=1.0.0
pkgrel=1
arch=(any)
url="https://${_base/-/}.org"
license=('custom:BSD-3-clause')
depends=(python-click python-jinja python-jsonschema python-linkify-it-py python-myst-nb
  python-yaml python-sphinx-comments python-sphinx-copybutton python-sphinx-external-toc
  python-sphinx-jupyterbook-latex python-sphinx_design python-sphinx-thebe python-sphinx-book-theme
  python-sphinx-togglebutton python-sphinxcontrib-bibtex python-sphinx-multitoc-numbering)
makedepends=(python-build python-installer python-flit-core)
checkdepends=(python-pytest python-jupytext python-texsoup)
source=(${_base}-${pkgver}rc1.tar.gz::https://github.com/executablebooks/${_base}/archive/v${pkgver}rc1.tar.gz)
sha512sums=('bcf839cbc02dcdb53be789d1dee3fd7eb2fa84301e2ffc4b63574d7654119ea31a45cfa07a9ad697d03a66b3dea3d04872d48ceb1ac6358850477628e840c29d')

build() {
  cd ${_base}-${pkgver}rc1
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}rc1
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
  cd ${_base}-${pkgver}rc1
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
