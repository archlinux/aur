# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptive
pkgname=python-${_base}
pkgver=1.3.1
pkgrel=1
pkgdesc="Parallel active learning of mathematical functions"
arch=(x86_64)
url="https://github.com/${pkgname}/${_base}"
license=(BSD-3-Clause)
depends=(python-cloudpickle python-loky python-scipy python-sortedcollections python-versioningit)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('11b1b834b32e71c8239db9c6e15da5702441529c1e27eef80c900f497fc3eaf01c74f0f5e2c3fb0a214da4a65216ac730c4ecba24ab25215c66dad242f6c0e20')

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
