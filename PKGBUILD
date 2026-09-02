# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-rca
pkgname=python-${_base}
pkgdesc="Remote Controlled Area widget for trame"
pkgver=2.9.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame-client python-wslink python-pillow python-numpy)
makedepends=(python-build python-installer python-hatchling nodejs npm)
# checkdepends=(python-pytest-xprocess python-pixelmatch python-playwright)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2c76e74d57894c557ae0bbbd771bcaa3c6791c01c07abbc13b6167d516ae3ec01a07ac0f49da16034662380bebf5d200f6c44182736edcedbe9b80f3f396442d')

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue-components
  npm install
  npm run build

  cd ${srcdir}/${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests/test_import.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
