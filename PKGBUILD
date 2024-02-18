# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=innerscope
pkgname=python-${_base}
pkgdesc="Expose the inner scope of functions"
pkgver=0.7.0
pkgrel=1
arch=(any)
url="https://github.com/eriknw/${_base}"
license=(BSD)
depends=(python-toolz)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('34d7ba7ffa587399e917e830a6d81aedd79699395ac6c7bfeb1c8f4a4aa4701c06e8c76955a4a0c001f187e80bbc3de5eabb46bc3a4353888de77650ebe89a1a')

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
