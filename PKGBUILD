# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=succulent
pkgname=python-${_base}
pkgver=0.4.3
pkgrel=1
pkgdesc="Collect POST requests easily"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-pandas python-yaml python-flask python-lxml)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4af14a3d547a762501ef7a712de9d5dcf9824ac70f872c7a528f227fc1ad5aa3defce9b8777ed9d33930302d5ec10d84269c3cd72c3e27b7cc098232261bd8fb')

build() {
  cd ${_base}-${pkgver}
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
