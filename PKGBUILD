# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optype
pkgname=python-${_base}
pkgdesc="Building blocks for precise & flexible type hints"
pkgver=0.12.0
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-beartype)
optdepends=('python-numpy: for Numpy Support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('649890e1885754854fe09c5568e595e165c375b367f00d5882e715a9885cbe8bc2de30d6af53d5e03a0c9a4b51da0d432e41ccf92b3afe69d9df5c60fb6f52a0')

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
