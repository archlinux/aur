# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer
pkgname=${_base}
pkgdesc="A tool for visualizing a preCICE configuration file as a dot file"
pkgver=1.1.1
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL-3.0-or-later)
depends=(python-lxml python-pydot python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('precice-config-visualizer-gui: for gui support')
source=(${_base/precice-/}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0678edbfd5b558a1cccc58ea61853d7015a0bfafc07c87a02074e4182e14c0e9811202b9b31bd0a1acf2f9d23511c588485f9ae2c5f38ce6b21855d1c9fed19c')

build() {
  cd ${_base/precice-/}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base/precice-/}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base/precice-/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
