# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vega
pkgname=python-${_base}
pkgdesc="Vega widget for trame"
pkgver=2.1.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(BSD-3-clause)
depends=(python-trame-client)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-hydrogen npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('af598a3ae6e4f68b231b1092b6b623f76d433a93bc6206979849acb3f771977683efce52e4d7ea24c6acba5f18ab17c3bffe9d9cd62d4355f9df5122d3ab7507')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue-components
  npm install
  npm run build

  cd ${srcdir}/${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
