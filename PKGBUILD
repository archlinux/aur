# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-client
pkgname=python-${_base}
pkgdesc="Internal client of trame"
pkgver=2.9.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-fermium npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e7995f95b7d615e48937b96890ac733ae1366caea17292e1ab09a78630d604e4e78c23949658bd2adf318817b019c29e0edecd83e1b028ecf395b45951edf84a')

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue2-app
  npm install
  npm run build
  cd ${srcdir}/${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
