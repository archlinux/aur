# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optype
pkgname=python-${_base}
pkgdesc="Building blocks for precise & flexible type hints"
pkgver=0.17.0
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-beartype python-typing_extensions python-numpy-typing-compat python-numpy)
optdepends=('python-numpy: for Numpy Support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2bc3eab8e60a0b724aeb77cb5b01462ded530607b988ea2e41e055d0e9b7aa3b5e158ac2fea25cffe27f71bf33223b33d473cdc13c83bd2370482091375d7067')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
