# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aleatory
pkgname=python-${_base}
pkgver=0.4.0
pkgrel=1
pkgdesc="Stochastic Processes Simulation and Visualisation"
url="https://github.com/quantgirluk/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-matplotlib python-parameterized python-statsmodels)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-v.${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz)
sha512sums=('bdefe236e9942226bcef40e34144eded184761754deb6a8a91c3549d7479c92900749dbe55fb073e837aebabe6ed6c87edfd4cec0bb8efe94b896cf879acf20c')

build() {
  cd ${_base}-v.${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-v.${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest
}

package() {
  cd ${_base}-v.${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
