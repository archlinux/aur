# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=succulent
pkgname=python-${_base}
pkgver=0.1.3
pkgrel=1
pkgdesc="Collect POST requests easily"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-pandas python-yaml python-flask)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest python-mock)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2e5c7684d809486405ab6c3ece1a54fa184130c07c607e842635f503b9cfeb04f0d343e75d932b7769f0b487560a49c633c19ad5eea9f88822cd20309ebc4ab6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not process_args and not process_json'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
