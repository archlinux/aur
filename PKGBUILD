# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-simput
pkgname=python-${_base}
pkgdesc="Simput implementation for trame"
pkgver=2.6.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame-client python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-iron npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('697036ecfed828d0c002c8ce11b7e08681a6d69bf6acf2f67003d91f0a17963bea87d50734307836e3e0c5824cace823b0cce6cbf4220ea7545fd4014f55c35d')

build() {
  # Workaround: https://stackoverflow.com/a/69746937/9302545
  # export NODE_OPTIONS=--openssl-legacy-provider
  # cd ${srcdir}/${_base}-${pkgver}/vue2-components
  # npm install
  # npm run build

  cd ${srcdir}/${_base}-${pkgver}/vue3-components
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
