# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="Parallel active learning of mathematical functions"
arch=(x86_64)
url="https://${_base}.readthedocs.io"
license=('custom:BSD-3-clause')
depends=(python-cloudpickle python-loky python-scipy python-sortedcollections python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a2a4551b46ba61212909f54af274f22b86ca2e96270e82b6d12decc5ab35f50daba3a9bbe4316a2e0de24858682d5ec066db90825d04c30516b2aa750dce9095')

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
