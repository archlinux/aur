# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optype
pkgname=python-${_base}
pkgdesc="Building blocks for precise & flexible type hints"
pkgver=0.17.1
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-beartype python-typing_extensions python-numpy-typing-compat python-numpy)
optdepends=('python-numpy: for Numpy Support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0a99bfbd141fd5f6e185e869b8b7debfab8f4373fdc4f4e3a99c21711c43f0320d63cc8ce1c2517e03945d2e29e26e5f504d4713401930da4cfc564fe41e2499')

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
