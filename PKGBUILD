# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-server
pkgname=python-${_base}
pkgdesc="Internal server side implementation of trame"
pkgver=3.8.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-wslink python-more-itertools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-asyncio)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b537f6d4bfeeb349f77a2539c3b5c78b1b2761119a9a18abcaf57c58315a39f07245e492355d6c5bfcdc172a1445573da4a5b7ff567afeba9be051b9f0139307')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    tests/test_controller.py tests/test_state.py tests/test_translator.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # Fix https://aur.archlinux.org/packages/python-trame-server#comment-1027059
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}${site_packages}/docs" "${pkgdir}${site_packages}/examples" "${pkgdir}${site_packages}/tests"
}
