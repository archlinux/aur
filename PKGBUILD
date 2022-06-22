# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=streamz
pkgname=python-${_base}
pkgver=0.6.3
pkgrel=3
pkgdesc="Real-time stream processing for python"
arch=(any)
url="https://github.com/${pkgname}/${_base}"
depends=(python-tornado python-toolz python-zict lzo snappy)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pandas python-distributed python-flaky python-networkx python-graphviz) #python-dask
optdepends=('python-pandas: for supports streams of Pandas dataframes or Pandas series')                   #python-cudf'
license=('custom:BSD-3-clause')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f52770bb6f6139051c628f6eb67fdc2ab8f3657a48d14cdedd68afdf0092f2d372338028e6a7a5e9292ba6bdb29888c5d0d6f01b6c38b7cd95f886fc048d5651')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest ${_base}/tests --ignore=streamz/tests/test_dask.py -k 'not separate_thread_without_time and not await_syntax'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
