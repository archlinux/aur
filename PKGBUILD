# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CMasher
pkgname=python-${_base,,}
pkgdesc="Scientific colormaps for making accessible, informative and cmashing plots"
pkgver=1.9.0
pkgrel=1
arch=(any)
url="https://github.com/1313e/${_base}"
license=(BSD-3-Clause)
depends=(python-colorspacious python-matplotlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-viscm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('de8636207968a4836ab095b4462c01f4dae561fde07f7256a9458f417d85f96a5976d4f90b65ae05c6e0b2856b31097c9ad12f64ba37929f2ef7a27a3fc2b466')

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
