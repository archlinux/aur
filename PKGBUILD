# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Conni2461 <Simon-Hauser@outlook.de>
_base=klepto
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="persistent caching to memory, disk, or database"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=('custom:BSD-3-clause')
depends=(python-dill python-pox)
makedepends=(python-setuptools)
checkdepends=(python-pytest) # python-h5py
optdepends=('python-jsonpickle: for serializers support'
  'python-cloudpickle: for serializers support'
  'python-sqlalchemy: for connect to MySQL or PostgreSQL database'
  'python-h5py: for support dictionary-style interface to a hdf5 file'
  'python-pandas: for dataframe support')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('8bdb8b02a498444a86af8a5fdcf93f43fc654c3dd8afa2a7b0ff98dc03275fac166fd8738070056a6ee61e16fe897e5ef05391163f8c5db8a58421b25d2f6885')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
