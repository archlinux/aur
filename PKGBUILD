# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Conni2461 <Simon-Hauser@outlook.de>
_base=klepto
pkgname=python-${_base}
pkgver=0.2.4
pkgrel=1
pkgdesc="persistent caching to memory, disk, or database"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=('custom:BSD-3-clause')
depends=(python-dill python-pox)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-h5py)
optdepends=('python-jsonpickle: for serializers support'
  'python-cloudpickle: for serializers support'
  'python-sqlalchemy: for connect to MySQL or PostgreSQL database'
  'python-h5py: for support dictionary-style interface to a hdf5 file'
  'python-pandas: for dataframe support')
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('78b9367d9bed22d68aa4d78201f0d81273d637ef86e9489c83890c3d50bea84ff89fe63c2848826db2e650a1602fe51e5495402d7883977a9ef6f7db3e72ddeb')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${_base}-${pkgver}
  python -m pytest -k 'not combinations and not basic and not alchemy and not methods and not roundtrip'
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
