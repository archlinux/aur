# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Philipp A <flying-sheep@web.de>
_base=umap
pkgname=python-${_base}-learn
pkgdesc="Uniform Manifold Approximation and Projection"
pkgver=0.5.6
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
sha512sums=('b8dfa55eb43368ce905f4f291b7de3a67ffd470dcabf93b298a2509df72d32bde084b7be309a156f428c5723252c0e2356558ee391ec4e9b62505305b332817f')

build() {
  cd ${_base}-release-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-release-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest 
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
