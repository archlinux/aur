# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiFlow
pkgname=python-${_base,,}
pkgver=3.2.0
pkgrel=1
pkgdesc="Differentiable PDE solving framework for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-phiml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax python-plotly)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('094e6bd2c72271437d2a14ebab4019f375322039446387da6fb0a81dac82760642d56ed86bf4e35c5061fa810841423b986b67045af9c1afa5c298f4cb51c16b')

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
