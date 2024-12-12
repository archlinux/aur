# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyFinitDiff
pkgname=python-${_base,,}
pkgdesc="A package for generating finite-difference matrices, particularly suited for physics and engineering applications"
pkgver=0.11.1
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-scipy python-mpsplots python-tabulate)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3406c19701afcf9ca1fc047e5397a86133540a470a68e43c6c848b1f43b042025cf31848f29e80cccbae45bed3e86ddd0294980e17386e1a2b66b19ad1a0ed5c')

build() {
  cd ${_base}-${pkgver}
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
}
