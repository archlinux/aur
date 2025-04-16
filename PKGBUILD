# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Conni2461 <Simon-Hauser@outlook.de>
_base=klepto
pkgname=python-${_base}
pkgver=0.2.7
pkgrel=1
pkgdesc="persistent caching to memory, disk, or database"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=(BSD-3-Clause)
depends=(python-dill python-pox)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-h5py)
optdepends=('python-jsonpickle: for serializers support'
  'python-cloudpickle: for serializers support'
  'python-sqlalchemy: for connect to MySQL or PostgreSQL database'
  'python-h5py: for support dictionary-style interface to a hdf5 file'
  'python-pandas: for dataframe support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b62f5da23825722c76136203e14f16a76450a5e39198128b38e05086f448d75001bae357df2653717adacf472b8285474b1a5897af280c1373ed4ea60da23398')

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
