# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-simput
pkgname=python-${_base}
pkgdesc="Simput implementation for trame"
pkgver=2.4.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame-client python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-hydrogen npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a9ca129ada9fdd20a0a5963472e282a8c657603fb4028ffdbcc504091c34f5b2804749bfd6292ea5c1c17380a312ad43159952ba91f05a5100a2bd5602872096')

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
