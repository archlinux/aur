# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=pgmpy
pkgname=python-${_base}
pkgver=0.1.23
pkgrel=1
pkgdesc="A library for Probabilistic Graphical Models"
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-networkx python-scikit-learn python-pytorch python-statsmodels python-tqdm python-joblib python-opt_einsum)
optdepends=('python-daft' 'python-lxml')
makedepends=(python-build python-installer python-setuptools python-wheel python-nbsphinx python-sphinx_rtd_theme)
checkdepends=(python-pytest python-mock python-daft)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('987af5a1dfa60eaa4472f747b8cb21beb8071f0899e81db41c12a64574b9780eb118c3f10687274de3d0539184a1fed4027ee68a95910b39aec029f2dcec31e1')

prepare() {
  sed -i '/"tests"/s/tests/*tests*/' ${_base}-${pkgver}/setup.py
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  make -C docs man BUILDDIR=_build
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 docs/_build/man/${_base}.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
