# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=autoray
pkgname=python-${_base}
pkgdesc="Abstract your array operations"
pkgver=0.8.9
pkgrel=1
arch=(any)
url="https://github.com/jcmgray/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-hatch-vcs python-wheel)
checkdepends=(python-pytest python-dask python-tensorflow python-pytorch python-jax python-sparse)
optdepends=('python-matplotlib: for visualizations'
  'python-networkx: for computational graph drawing'
  'python-pygraphviz: for graph layouts')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('239fe9509b387342e3479905a8b8f198f2ff8e3abf36bd87ba67140006f0d133c8e90722fc61527899ac325bd5d21ca06cf2fc076b6b4fd568177ab897e3ac08')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not cupy]'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
