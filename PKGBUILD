# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=9.0.0
pkgrel=1
arch=(x86_64)
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-matplotlib python-meshio python-h5py-openmpi python-autograd python-pyamg)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('425c72be361f396d8d81795d2b31a82a5cdf2aafb7411583bb916b4512962e4d9053cca195aff016c81b33b1f519fe82b9d1a9cc9f65b85613106fe2403fdc92')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --ignore=tests/test_examples.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
