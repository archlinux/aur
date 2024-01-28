# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Conni2461 <Simon-Hauser@outlook.de>
_base=klepto
pkgname=python-${_base}
pkgver=0.2.5
pkgrel=1
pkgdesc="persistent caching to memory, disk, or database"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=('custom:BSD-3-clause')
depends=(python-dill python-pox)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-h5py)
optdepends=('python-jsonpickle: for serializers support'
  'python-cloudpickle: for serializers support'
  'python-sqlalchemy: for connect to MySQL or PostgreSQL database'
  'python-h5py: for support dictionary-style interface to a hdf5 file'
  'python-pandas: for dataframe support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('490382d3b44d43f0e1e48d2f82df63b797bdda4ca82b4de2a99e8f0228bfaa802b39a5b70886137704191b49388ad40636c09be8d19a01a5d0e84405ecf1bc45')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not combinations and not basic and not alchemy and not methods and not roundtrip'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
