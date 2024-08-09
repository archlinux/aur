# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=10.0.1
pkgrel=1
arch=(x86_64)
url="https://github.com/kinnala/${_base}"
license=(BSD-3-Clause)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-matplotlib python-meshio
  python-h5py-openmpi python-jax python-pyamg python-shapely)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('21ee16ce5fe9017d98cd966a4a5fb17bb7745bf5860ccfe0b22d8e06722ae58ebb31e786e1d7aa02fde7f03a0e191d7456c5b764b9d2b6e9989165196589e800')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
