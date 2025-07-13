# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer
pkgname=${_base}-git
pkgdesc="A tool for visualizing a preCICE configuration file as a dot file"
pkgver=20250701
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(MIT)
depends=(python-lxml python-pydot python-typing_extensions xdot)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest)
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')
provides=(${_base})
conflicts=(${_base})

pkgver() {
  cd ${_base/precice-/}
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
  cd ${_base/precice-/}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base/precice-/}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base/precice-/}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
