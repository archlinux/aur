# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-rca
pkgname=python-${_base}
pkgdesc="Remote Controlled Area widget for trame"
pkgver=2.5.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame-client python-wslink python-pillow python-numpy)
makedepends=(python-build python-installer python-hatchling nodejs npm)
# checkdepends=(python-pytest-xprocess python-pixelmatch python-playwright)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b200e54214ec5c54375a28c8814d2c231edd2d78a2c368b79aaaad217748a94966510e393cc7b086e5130cc621687a5d863214b0c29937298b4ea7c5066496a0')

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
