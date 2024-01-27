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
source=(${_base}-${pkgver}.tar.gz::https://github.com/executablebooks/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('4dc6056db34cb3692d529a038ddd1042ddd27c352d180408cdc4dbe400e28a6c046d570303c635e19982cf5cabdc302188d569778c48d6d648690e730d525711')

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
