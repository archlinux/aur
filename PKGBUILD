# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=pgmpy
pkgname=python-${_base}
pkgver=0.1.22
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
sha512sums=('adf2e1ad1c42b0f468d281d2b40634c04cfe0cb7fefd05892b843bdc6c32a03a2522b156746168c185d98c1d0a3486c4e1b12fefa73e468b96da56e7f290591c')

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
