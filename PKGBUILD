# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=loky
pkgname=python-${_base}
pkgver=3.5.0
pkgrel=1
pkgdesc="Robust and reusable Executor for joblib"
arch=('x86_64')
url="https://github.com/joblib/${_base}"
license=('custom:BSD-3-clause')
depends=(python-cloudpickle)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-psutil python-numpy)
optdepends=('python-psutil: allow early memory leak detections')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('44cc37793e6bc9886a033fc4696b9ec4a193eec35e48dfc38a0755a16b2f614cdcfbf03b26f8346c9ccb39e88be674a1248fc1c49821cb6eda68fd7ee530adb8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not reusable_executor'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
