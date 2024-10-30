# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.5.1
pkgrel=1
pkgdesc="Python micro framework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/NiaOrg/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('2021c81882ce99f2b97c4fa892143c875717d69a819661f1ef6e5f8d923cca0b5c6d3afa2f0134bb95cba0bd08b4a5ea9f2e20fac618ff0ff03501f33ab937d7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/test_ilshade.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
