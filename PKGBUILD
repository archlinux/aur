# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-components
pkgname=python-${_base}
pkgdesc="Core components for trame widgets"
pkgver=2.2.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-client)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-gallium npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('24db816ba35f8787d6a4def37e6f39b0a2c1c4f5526a224b67f2ff01441dc8f28181a511c7e993991f9380945c52817bb6388b1a12aeebbefb095f9e13b5a94b')

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
