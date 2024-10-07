# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiFlow
pkgname=python-${_base,,}
pkgver=3.1.0
pkgrel=1
pkgdesc="Differentiable PDE solving framework for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-phiml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax python-plotly)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('93599b81d45794d3294f2a432a6659ece257662009132bb9e9aee3d3cfb97e34ed3b78959f8c991177d4f72db82afa80df23352c852c9b87fe874e2fdbd390ff')

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
