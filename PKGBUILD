# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiFlow
pkgname=python-${_base,,}
pkgver=3.4.0
pkgrel=1
pkgdesc="Differentiable PDE solving framework for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-phiml python-matplotlib python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax python-plotly)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0c4c8b3097dff79962a5cc47fe76f917a4e3bac479a8ab3c9a1689e4dddfd5f3e3e195953762d4e0cca271c3634a0d1cb9517f24f7cd2497a396ef42662be026')

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
