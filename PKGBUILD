# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-codeblocks
pkgname=python-${_base}
pkgdesc="Test code blocks in your READMEs"
pkgver=0.16.1
pkgrel=2
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4c3d91488550373832c8dd45b39873ae3810b423147b3b9524afc8e205605324092b4462b62acf2e34e70b5456795834cae511d9c9a06e08288a46cdb38b1778')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -p pytester
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
