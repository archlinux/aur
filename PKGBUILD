# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optype
pkgname=python-${_base}
pkgdesc="Building blocks for precise & flexible type hints"
pkgver=0.15.0
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-beartype python-typing_extensions python-numpy-typing-compat python-numpy)
optdepends=('python-numpy: for Numpy Support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c14c14b5a3e1a0269446234f3c1ab60b87d8831b0ece2131c8db64679d816a47ed91efb4be0581ff8f9478478bb32a304df76ddc427105e8d8ce3f7f42b1e00')

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
