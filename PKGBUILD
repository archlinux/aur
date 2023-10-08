# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=innerscope
pkgname=python-${_base}
pkgdesc="Expose the inner scope of functions"
pkgver=0.6.0
pkgrel=1
arch=(any)
url="https://github.com/eriknw/${_base}"
license=(BSD)
depends=(python-toolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a1eebb3445cdeabe7b85594c43e22ed762fbd58a8fd181eeded94a5d5a79dcd22e96012c005e66e36da08917a08ce3f07fa5ed73224ec344a6313d54a71d7d49')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not core'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
