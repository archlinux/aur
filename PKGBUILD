# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=autoray
pkgname=python-${_base}
pkgdesc="Abstract your array operations"
pkgver=0.7.0
pkgrel=1
arch=(any)
url="https://github.com/jcmgray/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest python-dask python-tensorflow python-pytorch python-jax python-sparse)
optdepends=('python-matplotlib: for visualizations'
  'python-networkx: for computational graph drawing'
  'python-pygraphviz: for graph layouts')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('74c81fd40ed8ef2234753ee7b85b2ffbdc8b2e0b71ef1d3de71241ea2cdb20de8f0f5723583f1a32033a307ad7b5bdce0dc59e3fb89b4c92acdc0cde682d0c6c')

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
