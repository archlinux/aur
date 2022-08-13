# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=streamz
pkgname=python-${_base}
pkgver=0.6.4
pkgrel=1
pkgdesc="Real-time stream processing for python"
arch=(any)
url="https://github.com/${pkgname}/${_base}"
depends=(python-tornado python-toolz python-zict lzo snappy)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pandas python-distributed python-flaky python-networkx python-graphviz) #python-dask
optdepends=('python-pandas: for supports streams of Pandas dataframes or Pandas series')                   #python-cudf'
license=('custom:BSD-3-clause')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('830c9dfadccce485ab0ee4e669a0a183648f826922fe5c3a7f647b6beb1ca853858e50327a629bc2d8942904fbad6fd4357639edc8a4bca4f8af94ec20263060')

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
