# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Conni2461 <Simon-Hauser@outlook.de>
_base=klepto
pkgname=python-${_base}
pkgver=0.2.1
pkgrel=2
pkgdesc="persistent caching to memory, disk, or database"
arch=('any')
url="https://github.com/uqfoundation/${_base}"
license=('custom:BSD-3-clause')
depends=(python-dill python-pox)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-h5py)
optdepends=('python-h5py: for support dictionary-style interface to a hdf5 file'
  'python-pandas: for dataframe support'
  'python-sqlalchemy: for connect to MySQL or PostgreSQL database'
  'python-jsonpickle: for serializers support'
  'python-cloudpickle: for serializers support')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('dac04c1b0d10e93865507c756d75b23c459ad4a65d258e1498ebfe313731e34803d3eb418848a5f316c84c0de183bffe2a399ade9ae23ae1db1db607ba81004e')

build() {
  cd "${_base}-${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${_base}-${pkgver}"
  python -m pytest -k 'not roundtrip and not combinations'
}

package() {
  cd "${_base}-${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
