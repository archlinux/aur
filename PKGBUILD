# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-client
pkgname=python-${_base}
pkgdesc="Internal client of trame"
pkgver=2.9.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-fermium npm)
checkdepends=(python-pytest-xprocess) # python-seleniumbase
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ddfda21085b9242cccb831d88172e6b43d64dc13c632b6f6fa1a820ae0370924f719525d88905f3f612a7a11d2d3f3846d775e41439444323ad3568eae62e7d6')

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
  test-env/bin/python -m pytest --ignore=tests/test_reactivity.py --ignore=tests/test_vue23.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
