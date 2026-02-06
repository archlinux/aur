# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.7.0
pkgrel=1
pkgdesc="Python micro framework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib python-openpyxl)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/NiaOrg/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('801eec12a3f53aa9c940c34799015a530ca86215af614b5dd108be840c1e207ec315c38795d4d2c7ce106b0283481e9ef8880235feab306fac005ab92cf26bc9')

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
