# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Conni2461 <Simon-Hauser@outlook.de>
_base=klepto
pkgname=python-${_base}
pkgver=0.2.3
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
sha512sums=('f1e738fe9457fe493af0972db1360464a657f141daca5698628366249a9a047055d26f8c18c59bfb00c0895ee0434f104c29b843f7f87b0d6d8bee1fcdd98122')

build() {
  cd ${_base}-${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${_base}-${pkgver}
  python -m pytest -k 'not combinations and not roundtrip'
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
