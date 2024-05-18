# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer
pkgname=${_base}
pkgdesc="A tool for visualizing a preCICE configuration file as a dot file"
pkgver=1.1.4
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL-3.0-or-later)
depends=(python-lxml python-pydot python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('precice-config-visualizer-gui: for gui support')
source=(${_base/precice-/}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cd547fa3e377346bd613d413fc3d36674ebf3bfc8a50e8e57e96636472bd07c23a7f6b7a1374f88812602e4684a3da8c5dd98b783006ba1977d4af94e1994717')

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
