# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=autoray
pkgname=python-${_base}
pkgdesc="Abstract your array operations"
pkgver=0.8.3
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
sha512sums=('80e51ba7be20b5af393b975d6601875af3b75c1b64ac5c162c41606156c28aec18d1806add0f9453a14c4d9910a9f02921be31c548163d53b927e3f5418d673c')

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
