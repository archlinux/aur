# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Philipp A <flying-sheep@web.de>
_base=umap
pkgname=python-${_base}-learn
pkgdesc="Uniform Manifold Approximation and Projection"
pkgver=0.5.7
pkgrel=1
arch=(any)
url="https://github.com/lmcinnes/${_base}"
license=(BSD-3-Clause)
depends=(python-pynndescent python-tqdm onetbb)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest) # python-tensorflow python-nose
# optdepends=('python-pandas: for '
#   'python-matplotlib: for '
#   'python-datashader: for '
#   'python-bokeh: for '
#   'python-holoviews: for '
#   'python-colorcet: for '
#   'python-seaborn: for '
#   'python-scikit-image: for '
#   'python-tensorflow: for '
#   'python-tensorflow-probability: for ')
source=(${_base}-release-${pkgver}.tar.gz::${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('84bdee369953daf07ec03c20f091d372ba2719859d315c76d32d52e95c7feff868131997238cc61e96bc639f2e45188bd4c2590933ada7ac382eaa8484d351c9')

build() {
  cd ${_base}-release-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-release-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not umap_update_large'
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
