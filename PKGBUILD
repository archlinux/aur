# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=1.2.0
pkgrel=1
pkgdesc="Parallel active learning of mathematical functions"
arch=(x86_64)
url="https://${_base}.readthedocs.io"
license=(BSD-3-Clause)
depends=(python-cloudpickle python-loky python-scipy python-sortedcollections python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c959c12be074764cb89fab9fc66976ed0ef21d80521c772234c754825b2d987d7410cb6747dc9e9ed586dd298bb27ccb910fb94c0c1804e7f540505333daf968')

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
