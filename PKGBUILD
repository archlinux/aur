# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=autoray
pkgname=python-${_base}
pkgdesc="Abstract your array operations"
pkgver=0.8.0
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
sha512sums=('67ca7a574701e9893c238c32ebf8e94b4374a831623f3af3d96f97b3fd195c22f59ee4dc8384a1b8b1bb177812c164c04356c472af79fa212c215c9c33fd3d33')

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
