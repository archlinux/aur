# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=autoray
pkgname=python-${_base}
pkgdesc="Abstract your array operations"
pkgver=0.8.10
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
sha512sums=('608844f6904415fef70b37b6a92e4f9857867e4a83c237e52bdd101cd287028eb398f9c8e171f8a00452d335f91b60c3f9771cb2355ecd5fd0b58bb8a9c04c7f')

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
