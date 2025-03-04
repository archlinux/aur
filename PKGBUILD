# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=1.3.2
pkgrel=1
pkgdesc="Parallel active learning of mathematical functions"
arch=(x86_64)
url="https://github.com/${pkgname}/${_base}"
license=(BSD-3-Clause)
depends=(python-cloudpickle python-loky python-scipy python-sortedcollections python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8eb729378ec17c3d309352b8a88cba54057950639d1d2974952f69056df6a3a05717de4862d1e5f64d194bc9a7a5f9049209ee2635d303ad9ebd2e0e297205ae')

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
