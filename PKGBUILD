# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CMasher
pkgname=python-${_base,,}
pkgdesc="Scientific colormaps for making accessible, informative and cmashing plots"
pkgver=1.9.2
pkgrel=1
arch=(any)
url="https://github.com/1313e/${_base}"
license=(BSD-3-Clause)
depends=(python-colorspacious python-matplotlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-viscm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a69bff6f2fc61a9a0aa08c9cbe901bdda67e5f76e19df64239c4fe0e84a27a05d0d6eea8477ce5817c992ad1e09349e9d172a713231369990e472c0d7b67c96b')

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
