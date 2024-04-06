# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer
pkgname=${_base}
pkgdesc="A tool for visualizing a preCICE configuration file as a dot file"
pkgver=0.2.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL-3.0-or-later)
depends=(python-lxml python-pydot xdot)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base/precice-/}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1677c75902bebc6519f3e203ad53833552c38c66e9d67d910b395881ce93d0348a1d0e1a438d9e0d55d78a54b7a68472a12c0b8cea3ef0e114867d2368109e59')

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
