# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aquarel
pkgname=python-${_base}
pkgdesc="Lightweight templating engine for matplotlib"
pkgver=0.0.6
pkgrel=1
arch=(any)
url="https://github.com/lgienapp/${_base}"
license=(MIT)
depends=(python-matplotlib python-cycler python-seaborn)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bedc765104d68081fde800f9c46fcbd070d61f841e784f541f3128b497bab2375c9f314188da38a0ff0e27b08be0eabee56edc6be73fb63042e8d0942ba61f32')

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
