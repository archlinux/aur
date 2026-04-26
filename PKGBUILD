# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=config-graph
pkgname=precice-${_base}
pkgdesc="A Library that builds a graph from a preCICE configuration file for validation and visualization purposes"
pkgver=2.1.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base}"
license=(MIT)
depends=(python-lxml python-elementpath python-matplotlib python-networkx)
makedepends=(python-build python-installer python-setuptools-git-versioning git)
checkdepends=(python-pytest python-gitpython)
source=(git+${url}.git#tag=v${pkgver})
sha512sums=('b8bc73017da57cfa0f31b2ea7fd247f7e6fbedb65ce013b7d01e9a03f4be2f3a4c2b81857fc828ddb6061f8dafe7d401291363d20c9db7fe1c98a23934d1e019')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
