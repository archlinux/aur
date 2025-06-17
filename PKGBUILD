# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=pgmpy
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="A library for Probabilistic Graphical Models"
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-networkx python-scikit-learn python-pytorch python-statsmodels python-tqdm python-joblib python-opt_einsum)
optdepends=('python-daft' 'python-lxml')
makedepends=(python-build python-installer python-setuptools python-wheel python-nbsphinx python-sphinx_rtd_theme)
checkdepends=(python-pytest python-mock python-daft-pgm python-xgboost python-pyparsing litellm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ef7a01316dfcb88d707d0a82bb21bdf4a4710d734128d331a7e7630d50981d704fd2e50fb1120c6940a7ffcd7acd26af44d60713caeb914bda7e07b936160f79')

# prepare() {
#   sed -i '/"tests"/s/tests/*tests*/' ${_base}-${pkgver}/setup.py
# }

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
