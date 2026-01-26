# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=rough-theory
pkgname=python-${_base}
pkgdesc="Various operations to analyze and leverage discernibility of knowledge"
pkgver=0.0.3
pkgrel=1
arch=(any)
url="https://github.com/johnHostetter/${_base}"
license=(MIT)
depends=(python-igraph python-graphviz)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('347d2a5cb064f8fc89cf6e3b4082140d7b44c429dd7870d25bc13d0ac8aba14c6d61c85ec61a71f501991735442dbfda5a05fd02206ddf55cca85a58f9e0f8e2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
