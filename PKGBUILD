# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Philipp A <flying-sheep@web.de>
_base=umap
pkgname=python-${_base}-learn
pkgdesc="Uniform Manifold Approximation and Projection"
pkgver=0.5.5
pkgrel=1
arch=(any)
url="https://github.com/lmcinnes/${_base}"
license=('custom:BSD-3-clause')
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
sha512sums=('e65b272fa539093d3436797d0ca2ee6ba9f7d28f6303db6a59561c0988b06c4dbcb86a9b261ca88fe71e27b835a8a1161d98a4516e41b09a291ee3b07d2da9d9')

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
