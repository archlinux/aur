# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiFlow
pkgname=python-${_base,,}
pkgver=2.5.3
pkgrel=1
pkgdesc="Differentiable PDE solving framework for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-phiml python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax python-plotly)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('709d7ce42d7d67e2bd30de27fb46fbcdf4363877cc4d6d2b8b972a8527e5249157be1403513bebd370049057d854b5dd08679ed1aca16b1c4d25b39bf1294504')

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
