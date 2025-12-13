# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=1.4.2
pkgrel=1
pkgdesc="Parallel active learning of mathematical functions"
arch=(x86_64)
url="https://github.com/${pkgname}/${_base}"
license=(BSD-3-Clause)
depends=(python-cloudpickle python-loky python-scipy python-sortedcollections python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('882b47c5111442b0fd4f548fedd48480ae2669c0698776547e2debfa18babb4d090feb356abc94e0bfac633fcd47afc82fa134d1860f33b0bde5e9cd71fc3348')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
