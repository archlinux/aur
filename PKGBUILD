# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiFlow
pkgname=python-${_base,,}
pkgver=3.0.0
pkgrel=1
pkgdesc="Differentiable PDE solving framework for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-phiml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax python-plotly)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('25ca5270e059ecffcb4ed35b578ad3d4c0daba5af95eeedccf7e3d948a7474862c4ced5748b0eff82450325eaf452e412885e60d4cf7e6b3780bd5f8a667c921')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not create_remove_at_equality_single and not properties and not write_read and not symmetry'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
