# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aleatory
pkgname=python-${_base}
pkgver=1.2.4
pkgrel=1
pkgdesc="Stochastic Processes Simulation and Visualisation"
url="https://github.com/quantgirluk/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-matplotlib python-parameterized python-statsmodels)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-ipywidgets)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ffb125bbf9dc50ad23b925b64deba5f00fde474bb87109c7d7e29e685cfd6f757d1ea0c13ff954fa7691b69de0b427005ae455571f7d86252a54bcb339798eef')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
